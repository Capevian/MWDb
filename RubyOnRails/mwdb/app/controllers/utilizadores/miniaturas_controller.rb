class Utilizadores::MiniaturasController < ApplicationController

  def index
    @title = "Miniaturas"
    if @construtor_id = params[:construtor_id]
      @construtor = Construtor.find(@construtor_id)
      @miniaturas = @construtor.miniaturas.paginate(:page => params[:page], :per_page => 10)
    else
      if
        @modelo_id = params[:modelo_id]
        @modelo = Modelo.find(@modelo_id)
        @miniaturas = @modelo.miniaturas.paginate(:page => params[:page], :per_page => 10)
      else
        if
          @escala_id = params[:escala_id]
          @escala = Escala.find(@escala_id)
          @miniaturas = @escala.miniaturas.paginate(:page => params[:page], :per_page => 10)
        else
          @miniaturas = Miniatura.paginate(:page => params[:page] , :per_page => 10)
        end

      end

    end


  end

  def show
    @title = "Detalhes da Miniatura"

    #Carregamento de todas as variaveis necessárias para mostrar na página da miniatura
    @miniatura = Miniatura.find(params[:id])
    @construtor = Construtor.find_by_id(@miniatura.construtor_id).nome
    @modelo = Modelo.find_by_id(@miniatura.modelo_id).nome
    @ano = Modelo.find_by_id(@miniatura.modelo_id).ano
    @escala = Escala.find_by_id(@miniatura.escala_id).descricao
    @marca = Marca.find_by_id(Modelo.find_by_id(@miniatura.modelo_id).marca_id).nome
    @fotos = @miniatura.foto_miniaturas.paginate(:page => params[:page], :per_page => 10)

    @media_avaliacoes = @miniatura.avaliacaos.sum(:avaliacao) / ( @miniatura.avaliacaos.count + 0.00000000000000000100)

    #Carregamento de um novo comentário e parametros relevantes
    @comentario = Comentario.new
    @comentario.user_id = current_user.id
    @comentario.miniatura_id = @miniatura.id

    #Carregamento de uma nova avaliacao e parametros relevantes
    @avaliacao = Avaliacao.new
    @avaliacao.user_id = current_user.id
    @avaliacao.miniatura_id = @miniatura.id

    #Carregamento dos comentários respectivos a esta miniatura
    @comentarios = @miniatura.comentarios
  end

end
