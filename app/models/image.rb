class Image < ApplicationRecord
	belongs_to :post 

  has_attached_file :image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  } ,default_url: "/images/:style/error.jpeg"
   validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
