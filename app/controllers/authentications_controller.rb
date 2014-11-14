class AuthenticationsController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:create]
  def create
    auth = request.env["omniauth.auth"]
    provider = Provider.find_by_provider_and_uid(auth["provider"], auth["uid"]) || Provider.create_with_omniauth(auth)
    sign_in(:user, provider.user)
    redirect_to root_url, :notice => t("devise.sessions.signed_in")
  end
end
