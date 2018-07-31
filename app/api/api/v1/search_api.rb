module Api::V1
  class SearchApi < Grape::API          
    namespace :search do
      helpers do                            
        def search_post 
          @p = []
          @id.each do |y|          
            @p.push(Post.where("posts.id = ? AND posts.price <= ? AND posts.price >= ? AND posts.type_house = ?",y ,params[:max_price] ,params[:min_price] ,params[:type_house]))           
          end 
          @p                                                 
        end      
      end    
      # method GET       
      params do       
        optional :city,        type: String
        optional :district,   type: String
        optional :min_price,    type: Integer
        optional :max_price, type: Integer 
        optional :type_house, type:Integer           
      end

      get do
        @id = []        
        arr = Address.where(city: params[:city], district: params[:district])
        arr.each do |i|
          # $id = []
          @id.push(i.post_id)           
        end   
        search_post                 
      end
        # method POST
        # method PUT         
        # method DELETE        
    end     
  end
end