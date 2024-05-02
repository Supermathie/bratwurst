require 'test_discourse_connect'
#require 'user'

class LoginController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    sso = TestDiscourseConnect.generate_sso
    redirect_to sso.to_url
  end
end
