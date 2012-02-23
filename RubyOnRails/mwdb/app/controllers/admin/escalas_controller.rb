class Admin::EscalasController < ApplicationController

  def index
    @title = "Indice"
    @escalas = Escala.paginate(:page => params[:page] , :per_page => 10)
  end

  def new
    @title = "Nova Escala"
    @escala = Escala.new
  end

  def create
    @title = "Cria escala"
    @escala = Escala.new(params[:escala])

    if @escala.save
      flash[:success]="Escala guardada com sucesso"
      redirect_to admin_path
    else
      flash[:error]="Falha a guardar a escala"
      redirect_to admin_escalas_path
    end
  end

  def destroy
    Escala.find(params[:id]).destroy
    flash[:succes] = "Escala Apagada!"
    redirect_to admin_escalas_path
  end

  def edit
    @title = "Editar Escala"
    @escala = Escala.find(params[:id])
  end

  def update
    @escala = Escala.find(params[:id])

    if @escala.update_attributes(params[:escala])
       flash[:success]="Escala actualizada com sucesso"
       redirect_to admin_escalas_path
    else
       flash[:error]="Falha a actualizar"
      redirect_to admin_escalas_path
    end
  end


end
