class User < ApplicationRecord
  
  has_many :api_keys , dependent: :destroy
  has_many :posts , dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  #devise :omniauthable, omniauth_providers: [:google_oauth2]
  # def self.from_omniauth(email)
  #   user=User.find_by(email: email)
  #   unless user
  #       user = User.create(
         
  #          email: email,
  #          password: Devise.friendly_token[0,20]
  #       )
  #   end
  #   user
  # end

  enum role: [:user, :admin]

  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  #validates :password, presence: true, length: { minimum: 6 }
  #validates :phone,presence: true , length:{maximum: 12}
  has_attached_file :avatar ,styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  } ,default_url: "/images/:style/missing.png"
   validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/


end
