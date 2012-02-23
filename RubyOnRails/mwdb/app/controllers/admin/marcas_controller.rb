class Admin::MarcasController < ApplicationController

  def index
    @title = "Marcas"
    @marcas = Marca.paginate(:page => params[:page] , :per_page => 10)
  end

  def show
  end

  def new
    @title = "Nova Marca"
    @tipos = Tipo.all
    @marca = Marca.new
  end

  def create

    #@marca = Marca.new
    #@marca.nome = params[:marca][:nome]
    #@marca.image_file = params.[:marca][:logo]
    #@marca.tipo_id = params
    #@tipo = params[:marca][:tipo_id]

    params[:marca][:logo] = params[:marca][:logo].read
    #@marca = @tipo.marcas.build(params[:marca])
    @marca = Marca.new(params[:marca])

    if @marca.save
      flash[:sucess] = "Marca criada com sucesso"
      redirect_to admin_path
    else
      flash[:error] = "Falha a guardar"
      redirect_to admin_path
    end
  end

  def edit
    @title = "Editar Marca"
    @marca = Marca.find(params[:id])
    @tipos = Tipo.all
  end

  def update
    #feito este assign complicado por causa do raio da foto...
    @marca= Marca.find(params[:id])

    @marcaaux = Marca.new
    @marcaaux.nome = params[:marca][:nome]
    @marcaaux.image_file = params[:marca][:logo]
    @marcaaux.tipo_id = params[:marca][:tipo_id]

    if @marca.update_attributes(:nome => @marcaaux.nome,:logo => @marcaaux.logo, :tipo_id => @marcaaux.tipo_id )
       flash[:success]="Marca actualizada com sucesso"
       redirect_to admin_marcas_path
    else
       flash[:error]="Falha a actualizar"
      redirect_to admin_marcas_path
    end
  end

  def destroy
    Marca.find(params[:id]).destroy
    flash[:success] = "Marca Dead"
    redirect_to admin_marcas_path
  end

end
