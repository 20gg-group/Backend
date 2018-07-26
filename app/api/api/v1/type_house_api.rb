module Api::V1
  class TypeHouseApi < Grape::API           
    namespace :type_house do

      # method GET            
      get ":type_house" do # get id type house 
        present TypeHouse.find_by type_house: params[:type_house]
      end
      get do       # get all type house
          present TypeHouse.all
      end

      # method PUT update type house
      params do
        optional :type_house,           type: String        
      end
      put ":id" do
        TypeHouse.find(params[:id]).update_attributes(declared(params))
        present TypeHouse.find(params[:id])
      end

      # method POST      
      params do
        optional :type_house,           type: String                   
      end      
      post do
        # post type_house          
        TypeHouse.create!(params)          
      end 

      #method DELETE
      delete ":id" do
        TypeHouse.find(params[:id]).destroy
        present "Destroyed"
      end    
    end        
  end
end