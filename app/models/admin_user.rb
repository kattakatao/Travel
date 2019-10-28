class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  accepts_attachments_for :posts, attachment: :image

 def email_required?
    false
  end
  def email_changed?
    false
  end

end
