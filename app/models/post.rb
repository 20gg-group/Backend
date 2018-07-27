class Post < ApplicationRecord
  belongs_to :user
  belongs_to :type_house
  has_one :address , dependent: :destroy
  has_many :images , dependent: :destroy
  has_one :detail , dependent: :destroy
  before_save :set_date_post

  validates :tittle, presence: true#,length:# {minimum:1, maximum:100}
  #validates :price,:area,:decription,:phone_contact_number, presence: true
  #accepts_nested_attributes_for :images

  def set_date_post
    self.date_post=Time.now
  end  

  def self.searcher_post(term)
    if term
      where('tittle LIKE :key AND
            decription LIKE :key',
            key: "%#{term}%")
      # where("name LIKE :name1 AND city = :cityId1",
      # {:name1 => "#{params[:name]}%", :cityId1 => params[:cityId]})
    else
      all
    end
  end
end