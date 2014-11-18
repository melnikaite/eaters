include ApplicationHelper

SETUP_PROC = lambda do |env|
  I18n.locale = env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  env['omniauth.strategy'].options[:app_name] = I18n.t('title')
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :trello, Settings.trello.key, Settings.trello.secret,
           app_name: '', scope: 'read,write,account', expiration: 'never',
           setup: SETUP_PROC

  provider :facebook, Settings.facebook.key, Settings.facebook.secret,
           :scope => 'email,public_profile'

  provider :vkontakte, Settings.vkontakte.key, Settings.vkontakte.secret,
           :scope => 'email,offline'

  on_failure { |env| Devise::OmniauthCallbacksController.action(:failure).call(env) }
end
