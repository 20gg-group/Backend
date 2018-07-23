module Api::Entities
    class UserEntity < Grape::Entity
      root 'users'
      expose :email, documentation: { type: "String" }
      expose :username, documentation: { type: "String" }
      expose :phone, documentation: { type: "String" }
      expose :id, documentation: { type: "String" }
      expose :role, documentation: {type: "String"}
    end
  end