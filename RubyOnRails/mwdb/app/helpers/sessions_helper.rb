module SessionsHelper

  ###############################    SIGN IN     ####################################################
  #Função que permite o sign_in, cria um cookie com os dados do utilizador e atribui o current user
  def sign_in(user)
    cookies.permanent.signed[:remember_token] = [user.username , user.password]
    current_user = user
  end


  #Método de atribuiçao do current_user...
  def current_user=(user)
    @current_user = user
  end

  #isto escreve-se assim tb: @current_user = @current_user || user_from_remember_token
  def current_user
    @current_user ||= user_from_remember_token
  end


  #Método que serve para perceber se está signed in ou nao
  def signed_in?
    !current_user.nil?
  end

  ###############################    SIGN OUT    ######################################################

  #Função que efectivamente executa o sign out, apaga o cookie e posiciona o current user a nil
  def sign_out
    cookies.delete(:remember_token)
    current_user = nil
  end

  private

  #Função que devolve o utilizador cujos parametros correspondem aos do cookie
  #Usa a debaixo para sacar o remember token da cookie
  #Usa * porque é uma maneira do ROR passar como argumento um array com duas dimensões que é o tipo do remember roken
  def user_from_remember_token
    User.authenticate_cookie(*remember_token)
  end

  #Função que obtém o remember token da cookie actual
  def remember_token
    cookies.signed[:remember_token] || [nil,nil]
  end


end
