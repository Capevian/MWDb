class UsersController < ApplicationController

  #Para a criação de um novo utilizador
  #User é new pois vai ser preenchido pelo form na view/users/new
  def new
    @title = "Registo"
    @user = User.new
  end





  def show
    @user = User.find(params[:id])
  end



  #Literalmente cria um utilizador para a BD, responde a post
  #Se @user.save tem sucesso vai para a BD
  #Se não, recarrega o titulo para Registo e volta a desenhar o 'new' acima
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:succes] = "Registado com sucesso no MWDb"
      redirect_to @user

    else
      @title = "Registo"
      render 'new'
    end
  end




  def destroy
  end

end
