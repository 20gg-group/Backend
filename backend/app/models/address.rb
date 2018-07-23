class Address < ApplicationRecord
  belongs_to :post
  validates :city,:district,:street,:house_no , presence: true
end
