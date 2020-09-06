class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
    :rememberable,
    :omniauthable,
    omniauth_providers: [:google_oauth2]


  #  Validations

  ## Presence

  validates :name,
    :email,
    presence: true

  ## Uniqueness

  validates_uniqueness_of :email


  # Helpers

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    unless user
      user = User.create(name: data['name'],
         email: data['email'],
         password: Devise.friendly_token[0,20]
      )
    end

    user
  end
end
