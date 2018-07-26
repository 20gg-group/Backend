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

          optional :air_conditioner,                coerce: Boolean 
          optional :washing_machine,                coerce: Boolean
          optional :refrigerator,                   coerce: Boolean
          optional :WC,                             coerce: Boolean 
          optional :parking,                        coerce: Boolean 
          optional :Wifi,                           coerce: Boolean
          optional :free_time,                      coerce: Boolean
          optional :separated_owner,                coerce: Boolean 

          optional :kitchen,                        coerce: Boolean 
          optional :bed,                            coerce: Boolean
          optional :television,                     coerce: Boolean
          optional :Wardrobe,                       coerce: Boolean 
          optional :amezzanine,                     coerce: Boolean 
          optional :camera,                         coerce: Boolean
          optional :security,                       coerce: Boolean
          optional :pet,                            coerce: Boolean                           
        end
      end
      post do
        # post advertisment           
        Detail.create!(params)
      end     
    end             
  end
end


  