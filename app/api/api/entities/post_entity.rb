module Api::Entities
  class PostEntity < Grape::Entity
    root 'post'
    expose :id,  documentation: { type: "Integer" }
    expose :title, documentation: { type: "String" }
    expose :price, documentation: { type: "String" }
    expose :area, documentation: { type: "String" }
    expose :description, documentation: { type: "String" }
    expose :date_post, documentation: { type: "String" }
    expose :phone_contact_number, documentation: { type: "String" }
    expose :type_house ,documentation: { type: "Integer" }
    expose :sex ,documentation: { type: "Integer" }
    expose :quantity, documentation: { type: "Integer" }
    expose :detail_ids
    expose :date_post
    expose :image,using: Api::Entities::ImageEntity  do |instance|
      instance.images.first
    end
    expose :address , using: Api::Entities::AddressEntity
  end
end