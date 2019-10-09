class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :sns_credentials, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,  :trackable, :validatable, :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def email_required?
    false
  end
  def email_changed?
    false
  end

  def self.find_for_oauth(auth)
    end_user = EndUser.where(uid: auth.uid, provider: auth.provider).first

    unless end_user
      end_user = EndUser.create(
        uid:      auth.uid,
        provider: auth.provider,
        name: auth.info.name,
        email:    auth.info.email,
        password: Devise.friendly_token[0, 20]
      )
    end

    end_user
  end


end