class Utilizadores::TiposController < ApplicationController

  def index
    @title = "Todos os Tipos de Miniaturas"
    @tipos = Tipo.paginate(:page => params[:page], :per_page => 5)
  end

end
