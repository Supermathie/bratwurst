require 'single_sign_on'
class TestSSO < SingleSignOn

  def sso_url
    ENV['SSO_URL'] or "/sso"
  end

  def sso_secret
    ENV['SSO_SECRET'] or 'thisisabadideatouseoutsideofssotesting'
  end

  def self.generate_sso
    sso = new
    sso.nonce = SecureRandom.hex
    sso
  end
end
