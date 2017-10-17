require 'testsso'
#require 'user'

class LoginController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    sso = TestSSO.generate_sso
    redirect_to sso.to_url
  end
end
