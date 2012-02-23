class Admin::MiniaturasController < ApplicationController

  def index
    @title = "Miniaturas"
    @miniaturas = Miniatura.paginate(:page => params[:page] , :per_page => 10)
  end

  def new
    @title = "Nova Miniatura"
    @miniatura = Miniatura.new
    @modelos = Modelo.all
    @escalas = Escala.all
    @construtors = Construtor.all

  end

  def create
    params[:miniatura][:thumb] = params[:miniatura][:thumb].read
    #@marca = @tipo.marcas.build(params[:marca])
    @miniatura = Miniatura.new(params[:miniatura])

    if @miniatura.save
      flash[:sucess] = "Miniatura criada com sucesso"
      redirect_to admin_path
    else
      flash[:error] = "Falha a guardar"
      redirect_to admin_path
    end
  end

  def edit
    @title = "Editar Miniatura"
    @miniatura = Miniatura.find(params[:id])
    @modelos = Modelo.all
    @escalas = Escala.all
    @construtors = Construtor.all
  end

  def update
    #Nota: está a ser usada esta maneira esquisita por causa da foto que tem que ser extraída
    @miniatura= Miniatura.find(params[:id])

    @miniaturaaux = Miniatura.new
    @miniaturaaux.descricao = params[:miniatura][:descricao]
    @miniaturaaux.image_file = params[:miniatura][:thumb]
    @miniaturaaux.modelo_id = params[:miniatura][:modelo_id]
    @miniaturaaux.construtor_id = params[:miniatura][:construtor_id]
    @miniaturaaux.escala_id = params[:miniatura][:escala_id]

    if @miniatura.update_attributes(:descricao => @miniaturaaux.descricao,
                                    :thumb => @miniaturaaux.thumb,
                                    :modelo_id => @miniaturaaux.modelo_id,
                                    :construtor_id => @miniaturaaux.construtor_id,
                                    :escala_id => @miniaturaaux.escala_id)
       flash[:success]="Miniatura actualizada com sucesso"
       redirect_to admin_miniaturas_path
    else
       flash[:error]="Falha a actualizar"
      redirect_to admin_miniaturas_path
    end
  end

  def destroy
    Miniatura.find(params[:id]).destroy
    flash[:success] = "Miniatura Apagada"
    redirect_to admin_miniaturas_path
  end

end
