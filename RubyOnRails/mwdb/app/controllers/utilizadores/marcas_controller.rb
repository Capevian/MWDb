class Utilizadores::MarcasController < ApplicationController

  def index
    @title = "Marcas"
     if @tipo_id = params[:tipo_id]
        @tipo = Tipo.find_by_id(@tipo_id)
        @marcas = @tipo.marcas.paginate(:page => params[:page], :per_page => 10)
     else
        @marcas = Marca.paginate(:page => params[:page] , :per_page => 10)
     end
  end

end
