module Api::Entities
    class UserEntity < Grape::Entity
      root 'user'
      expose :full_name, documentation: { type: "String"}
      expose :email, documentation: { type: "String"}
      expose :phone_number, documentation: { type: "String" }
      expose :avatar #,documentation: { type: "File" }
    end
  end