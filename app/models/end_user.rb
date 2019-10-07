class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,  :trackable, :validatable, :omniauthable, omniauth_providers: %i[facebook twitter google_oauth2]
  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
# omniauthのコールバック時に呼ばれるメソッド

  def email_required?
    false
  end
  def email_changed?
    false
  end
  def self.from_omniauth(auth)
  	where(provider: auth.provider, uid: auth.uid).first_or_create do |end_user|
  		end_user.email = auth.info.email
  		end_user.password = Devise.friendly_token[0,20]
  	end
  end
end
