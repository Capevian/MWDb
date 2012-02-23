class Admin::FotoMiniaturasController < ApplicationController

  def index
    @title = "Fotos desta miniatura"
    @miniatura_id = params[:miniatura_id]
    @miniatura = Miniatura.find_by_id(@miniatura_id)
    @foto_miniaturas = @miniatura.foto_miniaturas.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @title = "Nova Foto"
    @foto_miniatura = FotoMiniatura.new
    @minitura_id = params[:miniatura_id]
  end

  def create
    #Create manhoso por causa das fotos esterem codificadas
    params[:foto_miniatura][:foto] = params[:foto_miniatura][:foto].read

    @foto_miniatura = FotoMiniatura.new
    @foto_miniatura.miniatura_id = params[:miniatura_id]
    @foto_miniatura.foto = params[:foto_miniatura][:foto]


    if @foto_miniatura.save
      flash[:sucess] = "Foto Inserida com sucesso"
      redirect_to admin_miniaturas_path
    else
      flash[:error] = "Falha a guardar"
      redirect_to admin_miniaturas_path
    end
  end

  def destroy
    FotoMiniatura.find(params[:id]).destroy
    flash[:success] = "Foto Removida"
    redirect_to admin_miniaturas_path
  end

end
