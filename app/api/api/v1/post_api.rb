module Api::V1
    class PostApi < Grape::API
    helpers do
      def post
        @post ||= Post.find(params[:id])
      end      
    end    

    resources :posts do
  
      desc "show all Post"
      get do
        present Post.all ,with: Api::Entities::PostEntity , except: [:tittle]
      end

      desc "show post with id "
      get ":id" do
        
        user = post.user 
        add = post.address
        present :post,post,with: Api::Entities::PostEntity
        present :user,user, with: Api::Entities::UserEntity
        present :address,add,with: Api::Entities::AddressEntity

      end
    
      # method POST      
      params do
          optional :user_id,                        type: Integer #test
          optional :tittle,                         type: String
          optional :price,                          type: Float
          optional :area,                           type: Float
          optional :decription,                     type: String
          optional :phone_contact_number,           type: String                    
      
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
