module Api::V1
  class AddressApi < Grape::API
    helpers do
      def address
        @address ||= Address.find(params[:id])
      end      
    end    
    resources :addresses do  
      # method GET id cua      
      namespace :post do
        get ":id" do # get addresses/advertisment/:id
          present Address.find_by post_id: params[:id] 
        end
        get ":id/district" do # get addresses/advertisment/:id
          @addr = Address.find_by post_id: params[:id] 
          present @addr.district
        end
      end
        get ":id" do # get addresses/:id
          present address
        end
        get do        # get all address
          present Address.all
        end
      #method POST

      params do
        requires :post_id,                          type: Integer        
        given :post_id do
          optional :city,                           type: String
          optional :district,                       type: String          
          optional :street,                         type: String
          optional :house_no,                       type: Integer                                         
        end
      end
      post do
        # post detail           
        Address.create!(params)
      end 
    end   
  end
end





