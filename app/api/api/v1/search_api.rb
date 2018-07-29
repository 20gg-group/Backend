module Api::V1
  class SearchApi < Grape::API      
    namespace :search do
      # method GET       
      params do       
    		optional :city,        type: String
    		optional :district,   type: String
    		#optional :city,    type: String, desc: "city"
    		#optional :district, type: String, desc: "district"  			       
      end
      get do               
      a = Address.where(city: params[:city],
       		     district: params[:district])      
      a.each do |t|     	
				Post.where(id: t.post_id).find_each do |post|
  			 post
				end      	
      end      	
      															
        #.joins(:address)
        #present "Done"
        
      end
        # method POST
        # method PUT         
        # method DELETE        
    end      
    
  end
end