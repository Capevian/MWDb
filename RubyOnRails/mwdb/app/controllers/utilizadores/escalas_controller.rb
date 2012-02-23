class Utilizadores::EscalasController < ApplicationController

  def index
    @titulo = "Escalas"
    @escalas = Escala.paginate(:page => params[:page] , :per_page => 10)
  end

end
