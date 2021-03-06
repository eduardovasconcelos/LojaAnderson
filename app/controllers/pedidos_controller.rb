class PedidosController < ApplicationController
  
  skip_before_filter :verify_authenticity_token, :only => [:auto_complete_for_cliente_to]
  
  # GET /pedidos
  def index
    @pedidos = Pedido.paginate :page => params[:page], :per_page => 5
  end

  #Função de procura de pedidos
  def search
    @pedidos = Pedido.search(params[:q]).paginate :page => params[:page], :per_page => 5
    render :action => "index"
  end


  def show_itens
    find(:all,
      :conditions => ["pedidos.id like :pattern",
        {:pattern => "%#{itens}%"}
      ])
    render :action => "show"
  end

  # GET /pedidos/1
  def show
    @pedido = Pedido.find(params[:id])
  end

  # GET /pedidos/new
  def new
    @pedido = Pedido.new(:cliente => Cliente.find(params[:cliente_id]))
    1.times {@pedido.itempedidos.build}
  end
  
  # GET /pedidos/1/edit
  def edit
    @pedido = Pedido.find(params[:id])
  end

  # Função de criação de um novo pedido
  def create
    @pedido = Pedido.new(params[:pedido])
    @pedido.user = session_user.nome
    if @pedido.save
      flash[:notice] = 'Pedido cadastrado com sucesso.'
      redirect_to :action => "editar_itens", :id => @pedido.id
    else
      render :action => "new"
    end
  end

  def editar_itens
    @pedido = Pedido.find(params[:id])
  end

  # Função de fazer a edição dos pedidos.
  def update
    @pedido = Pedido.find(params[:id])
    @pedido.user = session_user.nome
    cliente = Cliente.find_by_nome(params[:cliente][:nome])
    if !cliente.nil?
      @pedido.cliente_id = cliente.id
    end
    if @pedido.update_attributes(params[:pedido])
      flash[:notice] = 'Pedido foi atualizado com sucesso.'
      redirect_to(@pedido)
    else
      render :action => "edit"
    end
  end

  # Função de fazer a deleção dos pedidos
  def destroy
    @pedido = Pedido.find(params[:id])
    #For para cada produto encontrado
    @itempedido = Itempedido.find_by_pedido_id(params[:id])
    @produto = Produto.find_by_valor(@itempedido.valor)
    #@produto.update_attributes(:estoque => 10)
    @pedido.destroy
    @itempedido.destroy
    redirect_to(pedidos_url)
  end

  #Action para realizar o auto_complete no nome do cliente na view dos pedidos
  def auto_complete_for_cliente_nome()
    @clientes = Cliente.find(:all,
      :conditions => ['UPPER(nome) like ?',
        "#{params[:cliente][:nome]}%"]);
    render :inline => "<%=auto_complete_result(@clientes,'nome') %>"
       
  end

  #Action para realizar o auto_complete no nome do produto na view dos pedidos
  def auto_complete_for_produto_nome()
    @produtos = Produto.find(:all,
      :conditions => ['UPPER(nome) like ?',
        "#{params[:produto][:nome]}%"]);
    render :inline => "<%=auto_complete_result(@produtos,'nome') %>"
  end
  
  def adicionar_item
    pedido = Pedido.find_by_id(params[:id])
    if params[:produto].present? && params[:produto][:nome].present?
      produto = Produto.find_by_nome(params[:produto][:nome])
      if produto.present?
        pedido.adicionar_item(:produto_id => produto.id, :quantidade=> params[:quantidade])
        pedido.reload
      end
    end
    render :partial => "item", :collection => pedido.itempedidos
  end

  def remover_item
    pedido = Pedido.remover_item(params[:id])
    render :partial => "item", :collection => pedido.itempedidos
  end
end