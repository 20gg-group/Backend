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
      end
        get ":id" do # get addresses/:id
          present address
        end
        get do        # test thoi chac khong xai nhieu
          present Address.all
        end
    end   
  end
end