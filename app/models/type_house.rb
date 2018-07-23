class TypeHouse < ApplicationRecord
  has_many :posts , dependent: :destroy
  #validates :type_house,presence: true
end
