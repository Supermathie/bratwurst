require 'testsso'
#require 'user'

class SsoLoginController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    begin
      sso = TestSSO.parse(request.query_string)
    rescue TypeError
      render inline: "no sso result data present", :status => 400 and return
    end
    render template: "layouts/sso_login_result.html.erb", locals: { sso: sso}
  end
end
