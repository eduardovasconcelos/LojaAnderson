class LoginController < ApplicationController
  
  skip_before_filter :authenticate , :only => [:login]

  #Action responsável por efetuar e controlar o login no sistema
  def login
    if request.post?
      @user = User.login(params[:login], params[:password])
      if @user
        session[:user] = @user.id
        if session[:return_to] && !session[:return_to].include?(url_for(:action => "login"))
          redirect_to session[:return_to]
          session[:return_to] = nil
        else
          redirect_to :controller => "clientes"
        end
      else
        flash[:notice] = "Login ou Senha incorretos."
      end
    end
  end

  #Action responsável por efetuar e controlar o logout no sistema
  def logout
     session[:user] = nil
  end
end
