class Utilizadores::AvaliacaosController < ApplicationController

  def new
  end

  def create
    @avaliacao = Avaliacao.new(params[:avaliacao])
    @mini_id = params[:avaliacao][:miniatura_id]

    if @avaliacao.save
      #flash[:sucess] = "Avaliacao guardado com sucesso"
      redirect_to utilizadores_miniatura_path(@mini_id)
    else
      #flash[:error] = "Falha a guardar"
      redirect_to utilizadores_miniatura_path(@mini_id)
    end
  end

end
