module Api::Entities
    class UserEntity < Grape::Entity
      root 'user'
      expose :full_name, documentation: { type: "String"}
      expose :email, documentation: { type: "String"}
      expose :phone_number, documentation: { type: "String" }
      #avata_url
    end
  end