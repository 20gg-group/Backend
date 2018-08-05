class ApiKey < ApplicationRecord
  belongs_to :user
  before_create :generate_token 

  private
  def generate_token
    begin
      self.access_token = SecureRandom.hex(10)
    end while self.class.exists?(access_token: access_token)
  end   
end
