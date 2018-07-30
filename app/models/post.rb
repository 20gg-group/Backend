class Post < ApplicationRecord
  belongs_to :user

  has_one :address, autosave: true, dependent: :destroy #autosave=> update , build_address=>tao obj
  #accepts_nested_attributes_for :address
  has_many :images , dependent: :destroy
  has_and_belongs_to_many :details 

  before_save :set_date_post

  validates :tittle, presence: true#,length:# {minimum:1, maximum:100}
  #validates :price,:area,:decription,:phone_contact_number, presence: true
  #accepts_nested_attributes_for :images

  #enum type_house: [:"house_for_rent", :"house_graft"]

  def set_date_post
    self.date_post=Time.now
  end
  # def search(pattern)
  #   # if pattern.blank?  # blank? covers both nil and empty string
  #   #   present "Can't find anything!"
  #   # else
  #     Post.where("tittle ILIKE :search",
  #                 search: "%#{pattern}%")
  #   end
  # end  
end