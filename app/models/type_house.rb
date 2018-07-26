class TypeHouse < ApplicationRecord
  has_many :posts , dependent: :destroy
  #validates :type_house,presence: true
  #enum type_of_house: [:room_share, :rent_house]
end
