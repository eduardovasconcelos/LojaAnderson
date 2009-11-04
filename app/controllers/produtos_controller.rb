class ProdutosController < ApplicationController
 
  # GET /produtos
  def index
    @produtos = Produto.find(:all, :conditions => ['nome LIKE ?',"#{params[:search]}%"])
    respond_to do |format|
     format.html  do
     end
     format.js do
       render :inline => "<%=auto_complete_result(@produtos,'nome') %>"
     end
    end
  end

  # GET /produtos/1
  def show
    @produto = Produto.find(params[:id])
  end

  # GET /produtos/new
  def new
    @produto = Produto.new
  end

  # GET /produtos/1/edit
  def edit
    @produto = Produto.find(params[:id])
  end

  # POST /produtos
  def create
    @produto = Produto.new(params[:produto])
      if @produto.save
        redirect_to(@produto)
      else
        render :action => "new"
      end
  end

  # PUT /produtos/1
  def update
    @produto = Produto.find(params[:id])
      if @produto.update_attributes(params[:produto])
        flash[:notice] = 'Produto atualizado com sucesso!'
        redirect_to(@produto)
      else
        render :action => "edit"
      end
  end

  # DELETE /produtos/1
  def destroy
    @produto = Produto.find(params[:id])
    @produto.destroy
    redirect_to(produtos_url)
  end

end
