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
    sso.avatar_url  = request[:user][:avatar_url]
    sso.avatar_force_update     = request[:user][:avatar_force_update] == '1'

    sso.admin         = request[:user][:admin] == '1'
    sso.moderator     = request[:user][:moderator] == '1'
    sso.add_groups    = request[:user][:add_groups].split(' ')
    sso.remove_groups = request[:user][:remove_groups].split(' ')
    sso.require_activation     = request[:user][:require_activation] == '1'
    sso.suppress_welcome_message     = request[:user][:suppress_welcome_message] == '1'
    puts sso.diagnostics
    return_url = sso.return_sso_url.nil? ? '/sso_login' : sso.return_sso_url
    redirect_to sso.to_url(return_url)
  end
end
