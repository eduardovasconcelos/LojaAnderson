class ClientesController < ApplicationController
  # GET /clientes
  def index
    @clientes = Cliente.paginate :page => params[:page], :per_page => 5
    #@clientes = Cliente.find(:all, :conditions => ['nome LIKE ?',"#{params[:search]}%"]).paginate :page => params[:page], :per_page => 5
  end

  #Função de procura de clientes
  def search
    @clientes = Cliente.search(params[:q]).paginate :page => params[:page], :per_page => 5
    render :action => "index"
  end

  # GET /clientes/1
  def show
    @cliente = Cliente.find(params[:id])
  end

  # GET /clientes/new
  def new
    @cliente = Cliente.new
  end

  # GET /clientes/1/edit
  def edit
    @cliente = Cliente.find(params[:id])
  end

  # POST /clientes
  def create
    @cliente = Cliente.new(params[:cliente])
      if @cliente.save
        flash[:notice] = 'Cliente criado com sucesso!'
        redirect_to(@cliente)
      else
        render :action => "new" 
      end
  end

  # PUT /clientes/1
  def update
    @cliente = Cliente.find(params[:id])
    if @cliente.update_attributes(params[:cliente])
        flash[:notice] = 'Cliente atualizado com sucesso!'
        redirect_to(@cliente)
    else
        render :action => "edit"
     end
  end

  # DELETE /clientes/1
  def destroy
    @cliente = Cliente.find(params[:id])
    @cliente.destroy
    redirect_to(clientes_url)
  end

  #Action responsável pela criação do grafico de pedidos do cliente
   def view_pedido_chart
      start_date= "2009-01-01"
      end_date="2009-12-31"
      @cliente_id = params[:id]
      cliente_details_with_pedidos =  Cliente.find_with_pedidos_in_date_range(@cliente_id,start_date,end_date)
      if(!cliente_details_with_pedidos.nil?)
          @cliente_details_with_pedidos = cliente_details_with_pedidos[0]
      else
          @cliente_details_with_pedidos = nil;
      end
      headers["content-type"]="text/html"
    end

end
