class ContabilidadesController < ApplicationController
  # GET /contabilidades
  # GET /contabilidades.xml
  def index
    @contabilidades = Contabilidade.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contabilidades }
    end
  end

  # GET /contabilidades/1
  # GET /contabilidades/1.xml
  def show
    @contabilidade = Contabilidade.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @contabilidade }
    end
  end

  # GET /contabilidades/new
  # GET /contabilidades/new.xml
  def new
    @contabilidade = Contabilidade.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @contabilidade }
    end
  end

  # GET /contabilidades/1/edit
  def edit
    @contabilidade = Contabilidade.find(params[:id])
  end

  # POST /contabilidades
  # POST /contabilidades.xml
  def create
    @contabilidade = Contabilidade.new(params[:contabilidade])

    respond_to do |format|
      if @contabilidade.save
        flash[:notice] = 'Valor criado com sucesso.'
        format.html { redirect_to(@contabilidade) }
        format.xml  { render :xml => @contabilidade, :status => :created, :location => @contabilidade }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @contabilidade.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contabilidades/1
  # PUT /contabilidades/1.xml
  def update
    @contabilidade = Contabilidade.find(params[:id])

    respond_to do |format|
      if @contabilidade.update_attributes(params[:contabilidade])
        flash[:notice] = 'Valor atualizado com sucesso.'
        format.html { redirect_to(@contabilidade) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @contabilidade.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contabilidades/1
  # DELETE /contabilidades/1.xml
  def destroy
    @contabilidade = Contabilidade.find(params[:id])
    @contabilidade.destroy

    respond_to do |format|
      format.html { redirect_to(contabilidades_url) }
      format.xml  { head :ok }
    end
  end
end
