module Api::V1
  class DetailApi < Grape::API
    resources :details do  
      # method GET 

      namespace :post do
        get ":id" do # get detail of post
          present Detail.find_by post_id: params[:id] 
        end
      end
        get ":id" do # get detail follow its id
          present address
        end
        get do        # get all detail
          present Detail.all
        end
      #method POST

      params do
        requires :post_id,                          type: Integer        
        given :post_id do
          optional :no_people_per_room,             type: Integer
          optional :gender,                         type: String

          optional :air_conditioner,                type: Boolean 
          optional :washing_machine,                type: Boolean
          optional :refrigerator,                   type: Boolean
          optional :WC,                             type: Boolean 
          optional :parking,                        type: Boolean 
          optional :Wifi,                           type: Boolean
          optional :free_time,                      type: Boolean
          optional :separated_owner,                type: Boolean 

          optional :kitchen,                        type: Boolean 
          optional :bed,                            type: Boolean
          optional :television,                     type: Boolean
          optional :Wardrobe,                       type: Boolean 
          optional :amezzanine,                     type: Boolean 
          optional :camera,                         type: Boolean
          optional :security,                       type: Boolean
          optional :pet,                            type: Boolean                           
        end
      end
      post do
        # post detail           
        Detail.create!(params)
      end 
      #method DELETE

      delete ":id" do
        Detail.find(params[:id]).destroy
        present "Destroyed"
      end    
    end             
  end
end


  