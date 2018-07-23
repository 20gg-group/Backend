module Api::V1
    class PostApi < Grape::API

      get do
        "abc"
      end
      # helpers do
      #   def product
      #     @product ||= Product.find(params[:id])
      #   end
      # end
  
      # # GET
      # get do
      # Time.zone.now
      # 'hello'
      # end
      # resource :products do
      
      #   get ":id" do
      #     present Product.find(params[:id]), with: Api::Entities::Product
      #   end
  
      #   params do 
      #     requires :name,type: String
      #     requires :price,type: Float
      #     requires :description,type: String
      #   end
      #   post do
      #    Product.create!(declared(params))
      #    #{ 'declared_params' => declared(params, include_missing: true) }
      #   end
  
      #   params do 
      #     requires :name,type: String
      #     requires :price,type: Float
      #     requires :description,type: String
      #   end
      #   put ":id" do
      #     product.update_attributes(declared(params,include_missing: false))
      #     present product
      #   end
  
      #   delete ":id" do 
      #     product.destroy
      #     present "Destroy"
      #   end
      # end


      module Api::V1
        class PostApi < Grape::API
          helpers do
          def post
            @post ||= Post.find(params[:id])
          end      
        end    
        resources :posts do
          # method GET
          get do
            present Post.all
          end
          get ":id" do
            present Post.find(params[:id])
          end
          # method POST      
          params do
            optional :user_id,                          type: Integer
            optional :type_house_id,                    type: Integer
            given :user_id, :type_house_id do
              optional :tittle,                         type: String
              optional :price,                          type: Float
              optional :area,                           type: Float
              optional :decription,                     type: String
              optional :phone_contact_number,           type: String                    
            end
          end
          post do
            # post advertisment           
            Post.create!(params)          
          end     
          # method PUT 
          params do
            optional :tittle,                      type: String
            optional :price,                      type: Float 
            optional :area,                       type: Float
            optional :decription,                 type: Integer
            optional :phone_contact_number,       type: String 
          end
          put ":id" do
            post.update_attributes(declared(params))
            present post
          end
          #method DELETE
          delete ":id" do
            post.destroy
            present "Destroyed"
          end
        end
        
          
        end
      end
    end
  end