class User < ApplicationRecord
  has_many :api_keys , dependent: :destroy
  has_many :posts , dependent: :destroy
  devise :database_authenticatable, :registerable,:recoverable, :validatable

  attr_accessor  :activation_token
  
  has_attached_file :avatar ,styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  } ,default_url: "https://s3.amazonaws.com/salty-brushlands-19787/users/avatars/000/000/defalt_avatar/avatar.jpg"
   validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  acts_as_voter

  

  attr_accessor :activation_code

  def valid_activation_code?(code)
    activation_digest == digest_token(code)
  end
  def activate_expired?
    active_sent_at < 6.hours.ago
  end
  def sent_account_activate_mail
    UserMailer.account_activation(self).deliver_now
  end
  def create_activation_digest
    loop do
      self.activation_code = ''
      6.times { self.activation_code << SecureRandom.random_number(9).to_s }
      self.activation_digest = digest_token(self.activation_code)
      break unless User.exists?(activation_digest: self.activation_digest)
    end
    update_columns(activation_digest: self.activation_digest, 
                    active_sent_at: Time.zone.now)
  end
  def digest_token(token)
    Digest::SHA256.hexdigest(token)
  end
  
end
