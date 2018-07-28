module Api::Entities
  class PostEntity < Grape::Entity
    root 'post'
    expose :tittle, documentation: { type: "String" }
    expose :price, documentation: { type: "String" }
    expose :area, documentation: { type: "String" }
    expose :decription, documentation: { type: "String" }
    expose :date_post, documentation: { type: "String" }
    expose :phone_contact_number, documentation: { type: "String" }
    #image_url
    #expose :address , using: API::Entities::AddressEntity
  
    
  end
end