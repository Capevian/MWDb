require "digest"

class User < ActiveRecord::Base

  #Expressão regular para validar e-mails , copiada
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  #Cria gets e sets
  attr_accessible :username,:password,:email,:password_confirmation


  #Regra de validação do username, deve estar presente e ter no max 50 caracteres
  validates :username, :presence => true, :length => {:maximum => 50}

  #Regra de validaação do e-mail, nada me mais
  validates :email, :presence => true, :format => {:with => email_regex}

  #Regra de validação da password, cria tambem o atributo virtual password_confirmation para uso futuro...
  validates :password, :presence => true, :confirmation => true, :length => {:within => 6..40}


  has_many :comentarios , :dependent => :destroy
  has_many :avaliacaos , :dependent => :destroy




  #Funções para autenticação

  #Verifica se uma password é igual à que ele tem
  def has_password?(submitted_password)
      password == submitted_password
  end


  #Devolve o user SE ele existir na BD E a sua password corresponder.
  def self.authenticate(username,submitted_password)
    user = find_by_username(username)
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
  end

  def self.authenticate_cookie(username,submitted_password)
    user = find_by_username(username)
    return nil if user.nil?
    return user if user.password == submitted_password
  end


  #Funções úteis

  def has_commented?(miniatura_id)
    self.comentarios.find_by_miniatura_id(miniatura_id)
  end

  def has_evaluated?(miniatura_id)
    self.avaliacaos.find_by_miniatura_id(miniatura_id)
  end


end
