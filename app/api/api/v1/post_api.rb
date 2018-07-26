module Api::V1
<<<<<<< HEAD
  class PostApi < Grape::API
    #   get ":id" do
    #     present Product.find(params[:id]), with: Api::Entities::Product
    #   end
=======
    class PostApi < Grape::API
>>>>>>> origin/tin
    helpers do
      def post
        @post ||= Post.find(params[:id])
      end      
    end    
<<<<<<< HEAD

    

    resources :posts do
      # method GET
      desc "show all Post"
      get do
        present Post.all 
      end
      desc "show post with id "
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
        optional :tittle,                     type: String
        optional :price,                      type: Float 
        optional :area,                       type: Float
        optional :decription,                 type: String
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
=======
    resources :posts do
      # method GET
      get do
        present Post.all
      end
      get ":id" do
        present Post.find(params[:id])
      end
      get ":type_house_id" do # get id type house cai nay viet choi thoi chac cung khong xai
        present Post.find_by type_house_id: params[:type_house_id]
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
        optional :tittle,                     type: String
        optional :price,                      type: Float 
        optional :area,                       type: Float
        optional :decription,                 type: String
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
>>>>>>> origin/tin
