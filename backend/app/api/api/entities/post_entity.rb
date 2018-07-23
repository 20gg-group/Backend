module Api::Entities
  class PostEntity < Grape::Entity
    root 'posts'
    expose :tittle, documentation: { type: "String" }
    expose :price, documentation: { type: "String" }
    expose :area, documentation: { type: "String" }
    expose :decription, documentation: { type: "String" }
    expose :date_post, documentation: { type: "String" }
    expose :phone_contact_number, documentation: { type: "String" }
    expose :address , using: API::Entities::Address
    expose :type_house, using API::Entities::TypeHouse
    
  end
end