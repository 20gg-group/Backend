module Api::Entities
  class PostEntity < Grape::Entity
    root 'post'
    expose :id,  documentation: { type: "Integer" }
    expose :tittle, documentation: { type: "String" }
    expose :price, documentation: { type: "String" }
    expose :area, documentation: { type: "String" }
    expose :decription, documentation: { type: "String" }
    expose :date_post, documentation: { type: "String" }
    expose :phone_contact_number, documentation: { type: "String" }
    expose :type_house ,documentation: { type: "Integer" }
    #details_ids
    #expose :image_url
    #expose :address , using: Api::Entities::AddressEntity
  
    
  end
end