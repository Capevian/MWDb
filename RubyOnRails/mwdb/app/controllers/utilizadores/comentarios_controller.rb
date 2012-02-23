class Utilizadores::ComentariosController < ApplicationController

  def new
  end

  def create
    @comentario = Comentario.new(params[:comentario])
    @mini_id = params[:comentario][:miniatura_id]

    if @comentario.save
      #flash[:sucess] = "Comentario guardado com sucesso"
      redirect_to utilizadores_miniatura_path(@mini_id)
    else
      #flash[:error] = "Falha a guardar"
      redirect_to utilizadores_miniatura_path(@mini_id)
    end

  end

  def show
  end

end
