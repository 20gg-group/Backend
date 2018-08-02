class User < ApplicationRecord
  
  has_many :api_keys , dependent: :destroy
  has_many :posts , dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :validatable

  enum role: [:user, :admin]

  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_attached_file :avatar ,styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  } ,default_url: "https://s3.amazonaws.com/salty-brushlands-19787/users/avatars/000/000/defalt_avatar/avatar.jpg"
   validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  acts_as_voter
  
end
