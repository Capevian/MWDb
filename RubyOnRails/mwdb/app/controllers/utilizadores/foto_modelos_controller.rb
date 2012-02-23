class Utilizadores::FotoModelosController < ApplicationController

  def index
    @title = "Fotos deste modelo"
    @modelo_id = params[:modelo_id]
    @modelo = Modelo.find_by_id(@modelo_id)
    @foto_modelos = @modelo.foto_modelos.paginate(:page => params[:page], :per_page => 10)
  end

  def show
  end

end
