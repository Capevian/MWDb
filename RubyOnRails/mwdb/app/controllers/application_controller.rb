class ApplicationController < ActionController::Base
  protect_from_forgery

  #Este helper tem apenas funções de signin
  include SessionsHelper


  def code_image
    @construtor = Construtor.find(params[:id])
    @logo = @construtor.logo
    send_data(@logo,:filename => @construtor.nome,
                     :disposition => 'inline')
  end

  def code_tipo_thumb
    @tipo = Tipo.find(params[:id])
    @thumb = @tipo.thumb
    send_data(@thumb ,:filename => @tipo.descricao,
                      :disposition => 'inline')
  end

  def code_image_marcas
    @marca = Marca.find(params[:id])
    @logo = @marca.logo
    send_data(@logo, :filename => @marca.nome,
                     :disposition => 'inline')
  end

  def code_image_modelos
    @modelo = Modelo.find(params[:id])
    @thumb = @modelo.thumb
    send_data(@thumb, :filename => @modelo.nome,
                      :disposition => 'inline')
  end

  def code_image_foto_modelos
    @foto_modelo = FotoModelo.find(params[:id])
    @foto = @foto_modelo.foto
    send_data(@foto, :filename => @foto_modelo.id,
                     :disposition => 'inline')
  end

  def code_image_miniaturas
    @miniatura = Miniatura.find(params[:id])
    @thumb = @miniatura.thumb
    send_data(@thumb, :filename => @miniatura.id,
                      :disposition => 'inline')
  end

  def code_image_foto_miniaturas
    @foto_miniatura = FotoMiniatura.find(params[:id])
    @foto = @foto_miniatura.foto
    send_data(@foto, :filename => @foto_miniatura.id,
                     :disposition => 'inline')

  end

end
