module Api::Entities
  class AddressEntity < Grape::API
    expose :city
    expose :district
    expose :street
    expose :house_no
  
  end
end