class Utilizadores::ModelosController < ApplicationController

  def index
    @title = "Modelos"
    if @marca_id = params[:marca_id]
       @marca = Marca.find_by_id(@marca_id)
       @modelos = @marca.modelos.paginate(:page => params[:page], :per_page => 10)
     else
        @modelos = Modelo.paginate(:page => params[:page] , :per_page => 10)
     end
  end

  def show
    @modelo = Modelo.find(params[:id])
    @marca = Marca.find_by_id(@modelo.marca_id).nome
    @fotos = @modelo.foto_modelos.paginate(:page => params[:page] , :per_page => 4 )
    @miniaturas = @modelo.miniaturas.paginate(:page => params[:page] , :per_page => 20)
  end

end
