Rails.application.config.middleware.use OmniAuth::Builder do
  provider :trello, Settings.trello.key, Settings.trello.secret,
           app_name: "жраки.рф", scope: 'read,write,account', expiration: 'never'

  provider :facebook, Settings.facebook.key, Settings.facebook.secret,
           :scope => 'email,public_profile'

  provider :vkontakte, Settings.vkontakte.key, Settings.vkontakte.secret,
           :scope => 'email,offline'

  on_failure { |env| Devise::OmniauthCallbacksController.action(:failure).call(env) }
end
