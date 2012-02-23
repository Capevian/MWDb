class SessionsController < ApplicationController


  def new
    @title = "Sign in"
  end

  def create
    user = User.authenticate(params[:sessions][:username],params[:sessions][:password])

    if user.nil?
      flash.now[:error] = "Password ou username errado."
      @title = "Sign In"
      render 'new'
    else
      sign_in user
      if current_user.admin?
        redirect_to admin_path
      else
        redirect_to root_path
      end

    end

  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
