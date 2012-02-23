class Utilizadores::FotoMiniaturasController < ApplicationController

  def index
    @title = "Fotos desta miniatura"
    @miniatura_id = params[:miniatura_id]
    @miniatura = Miniatura.find_by_id(@miniatura_id)
    @foto_miniaturas = @miniatura.foto_miniaturas.paginate(:page => params[:page], :per_page => 10)
  end

end
