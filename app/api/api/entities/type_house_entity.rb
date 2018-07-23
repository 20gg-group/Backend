module Api::Entities
  class TypeHouseEntity < Grape::API
    root 'TypeHouse'
    expose :type_house, documention:{type: "String"}
  end
end
