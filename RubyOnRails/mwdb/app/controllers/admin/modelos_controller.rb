class Admin::ModelosController < ApplicationController

  def index
    @title = "Modelos"
    @modelos = Modelo.paginate(:page => params[:page] , :per_page => 10)
  end

  def create
     params[:modelo][:thumb] = params[:modelo][:thumb].read
    #@marca = @tipo.marcas.build(params[:marca])
    @modelo = Modelo.new(params[:modelo])

    if @modelo.save
      flash[:sucess] = "Modelo criado com sucesso"
      redirect_to admin_path
    else
      flash[:error] = "Falha a guardar"
      redirect_to admin_path
    end
  end

  def new
    @title = "Novo Modelo"
    @marcas = Marca.all
    @modelo = Modelo.new
  end

  def update

    #Nota: está a ser usada esta maneira esquisita por causa da foto que tem que ser extraída
    @modelo= Modelo.find(params[:id])

    @modeloaux = Modelo.new
    @modeloaux.nome = params[:modelo][:nome]
    @modeloaux.ano = params[:modelo][:ano]
    @modeloaux.website  = params[:modelo][:website]
    @modeloaux.image_file = params[:modelo][:thumb]
    @modeloaux.marca_id = params[:modelo][:marca_id]

    if @modelo.update_attributes(:nome => @modeloaux.nome,
                                 :thumb => @modeloaux.thumb,
                                 :ano => @modeloaux.ano,
                                 :website => @modeloaux.website,
                                 :marca_id => @modeloaux.marca_id )
       flash[:success]="Modelo actualizado com sucesso"
       redirect_to admin_modelos_path
    else
       flash[:error]="Falha a actualizar"
      redirect_to admin_modelos_path
    end
  end

  def edit
    @title = "Editar Modelo"
    @modelo = Modelo.find(params[:id])
    @marcas = Marca.all
  end

  def destroy
    Modelo.find(params[:id]).destroy
    flash[:success] = "Modelo Apagado"
    redirect_to admin_modelos_path
  end

end
