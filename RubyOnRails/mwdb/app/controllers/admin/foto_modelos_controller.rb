class Admin::FotoModelosController < ApplicationController

  def index
    @title = "Fotos deste modelo"
    @modelo_id = params[:modelo_id]
    @modelo = Modelo.find_by_id(@modelo_id)
    @foto_modelos = @modelo.foto_modelos.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @title = "Nova Foto"
    @foto_modelo = FotoModelo.new
    @modelo_id = params[:modelo_id]
  end

  def create

    #Create manhoso por causa das fotos esterem codificadas
    params[:foto_modelo][:foto] = params[:foto_modelo][:foto].read

    @foto_modelo = FotoModelo.new
    @foto_modelo.modelo_id = params[:modelo_id]
    @foto_modelo.foto = params[:foto_modelo][:foto]


    if @foto_modelo.save
      flash[:sucess] = "Foto Inserida com sucesso"
      redirect_to admin_modelos_path
    else
      flash[:error] = "Falha a guardar"
      redirect_to admin_modelos_path
    end
  end

  def destroy
    FotoModelo.find(params[:id]).destroy
    flash[:success] = "Foto Removida"
    redirect_to admin_modelos_path
  end

end
