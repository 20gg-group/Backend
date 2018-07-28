module Api::Entities
  class AddressEntity < Grape::Entity
     root 'Address'
      expose :city
      expose :district 
      expose :add_detail
  end
end
