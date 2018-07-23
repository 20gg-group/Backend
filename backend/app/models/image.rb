class Image < ApplicationRecord
	belongs_to :post , required: false

	# validates :extra_image, attachment_presence: true
	
  has_attached_file :image, styles: { medium: "400x400>", thumb: "200x200>" }, default_url: "/images/error_picture.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_with AttachmentSizeValidator, attributes: :image, less_than: 1.megabytes  
end
