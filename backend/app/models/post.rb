class Post < ApplicationRecord
  belongs_to :user
  belongs_to :type_house
  has_one :address , dependent: :destroy
  has_many :images , dependent: :destroy
  before_save :set_date_post

  validates :tittle, presence: true#,length:# {minimum:1, maximum:100}
  #validates :price,:area,:decription,:phone_contact_number, presence: true
  

  def set_date_post
    self.date_post=Time.now
  end
end