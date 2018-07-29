module Api::V1
    class PostApi < Grape::API
    helpers do
      def get_post
        @post ||= Post.find(params[:id])
      end      
    end    

    resources :posts do
  
      desc "show all Post"
      get do
        present Post.all ,with: Api::Entities::PostEntity #, except: [:tittle]
      end

      desc "show post with id "
      get ":id" do
        
        user = get_post.user 
        add = get_post.address
        present :post,get_post,with: Api::Entities::PostEntity
        present :user,user, with: Api::Entities::UserEntity
        present :address,add,with: Api::Entities::AddressEntity

      end
    
      # method POST 
      
      params do
          
            optional :user_id,                        type: Integer #test
          requires :post , type: Hash do
            requires :tittle,                         type: String
            optional :price,                          type: Float
            optional :area,                           type: Float
            requires :decription,                     type: String
            requires :phone_contact_number,           type: String 
          end        
          requires :address, type: Hash do
            requires :city, type: String
            requires :district ,type: String
            optional :add_detail, type: String
          end           
      end
      post do
        #authenticate!
        #user=User.find(current_user.id)
        user=User.find(params[:user_id])
         post=user.posts.create!(params[:post])
         address=post.build_address(params[:address])
         #address.new_record? #?? khi nao thi true or false
         address.save

         present :status ,"true"
         present :post , post ,with: Api::Entities::PostEntity
      
        
      end     

      # method PUT 
      params do
            #requires :post_id
          requires :post , type: Hash do
            requires :tittle,                         type: String
            optional :price,                          type: Float
            optional :area,                           type: Float
            requires :decription,                     type: String
            requires :phone_contact_number,           type: String 
          end        
          requires :address, type: Hash do
            requires :city, type: String
            requires :district ,type: String
            optional :add_detail, type: String
          end           
      end
      put ":id" do
        #authenticate!
        post=get_post
        post.update_attributes(params[:post])
        post.address.update_attributes(params[:address])

        present :status,"true"
        present :post,post,with: Api::Entities::PostEntity
      end

      #method DELETE
      delete ":id" do
        get_post.destroy
        present "true"
      end
    end      

  end
end
