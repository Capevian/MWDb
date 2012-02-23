class Admin::TiposController < ApplicationController

  def index
    @title = "Tipos de Miniaturas"
    @tipos = Tipo.paginate(:page => params[:page], :per_page => 5)
  end

  def new
    @title = "Novo tipo"
    @tipo = Tipo.new

  end

  def create

    @tipo = Tipo.new
    @tipo.descricao = params[:tipo][:descricao]
    @tipo.image_file = params[:tipo][:thumb]

    if @tipo.save
      flash[:success] = "Novo Tipo Guardado com sucesso"
      redirect_to admin_path
    else
      flash[:error] = "Falha a guardar Tipo"
      redirect_to admin_path
    end

  end

  def edit
  end

  def update
  end

  def destroy
  end

end
