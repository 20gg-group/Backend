class Post < ApplicationRecord
  belongs_to :user
  has_one :address, autosave: true, dependent: :destroy #autosave=> update , build_address=>tao obj
  accepts_nested_attributes_for :address 
  has_many :images , dependent: :destroy 
  accepts_nested_attributes_for :images,reject_if: :all_blank, allow_destroy: true

  before_save :set_date_post
  validates :title, presence: true
  enum role: [:user, :admin]
  acts_as_votable
  
  def set_date_post
    self.date_post=Time.now
  end

  
end