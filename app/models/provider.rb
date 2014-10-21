class Provider < ActiveRecord::Base
  belongs_to :user

  def self.create_with_omniauth(auth)
    #raise auth.to_yaml
    password = Devise.friendly_token.first(8)
    user = User.create_with(
      name: auth["info"]["name"],
      password: password,
      image: auth["info"]["image"]
    ).find_or_initialize_by(
      email: auth["info"]["email"]
    )

    unless user.id
      user.save!
      UserMailer.welcome_email(user, password).deliver
    end

    if !user.image && auth["info"]["image"]
      user.update_attribute(:image, auth["info"]["image"])
    end

    provider = user.providers.create!(
      provider: auth["provider"],
      uid: auth["uid"],
      token: auth["credentials"]["token"],
      secret: auth["credentials"]["secret"]
    )

    provider
  end
end
