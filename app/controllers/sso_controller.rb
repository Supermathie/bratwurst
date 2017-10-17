require 'testsso'

class SsoController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    begin
      sso = TestSSO.parse(request.query_string)
    rescue TypeError
      render inline: "no sso initiation data present", :status => 400 and return
    end
    render template: "layouts/sso_form.html.erb", :locals => { :payload => request.query_string }
  end

  def create
    sso = TestSSO.parse(request[:payload])
    sso.email       = request[:user][:email]
    sso.name        = request[:user][:name]
    sso.username    = request[:user][:username]
    sso.external_id = request[:user][:external_id]
    redirect_to sso.to_url(sso.return_url)
  end
end
