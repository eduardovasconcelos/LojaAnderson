# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  before_filter :authenticate
  before_filter :set_locale
  skip_before_filter :authenticate_administration, :only => [:access_denied]


  helper_method :session_user

  #Direcionamento dos acessos negados para a page no diretorio shared/
  def access_denied
    render :template => "shared/access_denied"
  end

  protected

  #Pegando os dados do usuario e alocando na sessão corrente
  def session_user
    @session_user ||= User.find(:first, :conditions => ['id = ?', session[:user]])
  end

  #Autenticação de usuario
  def authenticate
    unless session[:user]
      session[:return_to] = request.request_uri
      redirect_to :controller => "login", :action => "login"
      return false
    end
    return true
  end

  #Configuração de acesso. So admininstrador pode acessar
  def authenticate_administration
    unless session_user && session_user.admin?
      redirect_to :action => "access_denied"
      return false
    end
      return true
  end

  #Setando a localização, para as configurações da aplicação
  def set_locale
  # if this is nil then I18n.default_locale will be used
    I18n.locale = params[:locale]
  end

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'bd6e7cf72780bcc6475726e6da3af6d8'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
end
