class ItempedidosController < ApplicationController

#  skip_before_filter :verify_authenticity_token, :only => [:auto_complete_for_produto_to]
  
  # GET /itempedidos
  def index
    @itempedidos = Itempedido.find(:all)
  end

  # GET /itempedidos/1
  def show
    @itempedido = Itempedido.find(params[:id])
  end

  # GET /itempedidos/new
  def new
    @itempedido = Itempedido.new
  end

  # GET /itempedidos/1/edit
  def edit
    @itempedido = Itempedido.find(params[:id])
  end

  # POST /itempedidos/new
  def create
    @itempedido = Itempedido.new(params[:itempedido])
      if @itempedido.save
        flash[:notice] = 'Itempedido was successfully created.'
        redirect_to :controller => "pedidos", :action => "show", :id => @itempedido.pedido_id
      else
        render :action => "new"
      end
  end

  # PUT /itempedidos/1
  def update
    @itempedido = Itempedido.find(params[:id])
    produto = Produto.find_by_nome(params[:produto][:nome])
    if !produto.nil?
      @itempedido.produto_id = produto.id
    else
      render :action => "edit"
    end
    if @itempedido.update_attributes(params[:itempedido])
      flash[:notice] = 'Itempedido was successfully updated.'
      redirect_to(@itempedido)
    else
      render :action => "edit"
    end
  end

  # DELETE /itempedidos/1
  def destroy
    @itempedido = Itempedido.find(params[:id])
    @itempedido.destroy
    redirect_to(itempedidos_url)
  end
 
end
