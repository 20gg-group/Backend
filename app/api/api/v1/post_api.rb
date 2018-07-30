module Api::V1
    class PostApi < Grape::API
    helpers do
      def get_post
        @post ||= Post.find(params[:id])
      end
      def image_params      
        params[:image] = ActionDispatch::Http::UploadedFile.new(params[:image]) if params[:image].present?        
        ActionController::Parameters.new(params).permit(:image)
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
          
           # optional :user_id,                        type: Integer #test
          requires :post , type: Hash do
            requires :tittle,                         type: String
            optional :price,                          type: Float
            optional :area,                           type: Float
            requires :decription,                     type: String
            requires :phone_contact_number,           type: String 
            optional :type_house,                     type: Integer
            #optional :detail_ids,                     type: Array[Integer]
          end        
          requires :address, type: Hash do
            requires :city, type: String
            requires :district ,type: String
            optional :add_detail, type: String
          end           
          requires :image, type: File  

      end
      post do
        #authenticate!
         #post = current_user.posts.create!(params[:post])
        user=User.find(params[:user_id])
        post = user.posts.create!(params[:post])

         address = post.build_address(params[:address])
         address.save
         image = post.images.new(image_params)
         image.save!

          present :status ,"true"
          present :post , post ,with: Api::Entities::PostEntity
          present :images_url, image.image.url
        
      end     

      # method PUT 
      params do
            #requires :post_id
          requires :post , type: Hash do
            requires :tittle,                         type: String
            optional :price,                          type: Float
            optional :area,                           type: Float
            optional :decription,                     type: String
            optional :phone_contact_number,           type: String 
            optional :type_house,                     type: Integer
          end        
          requires :address, type: Hash do
            requires :city, type: String
            requires :district ,type: String
            optional :add_detail, type: String
          end 
          requires :image, type: File            
      end
      put ":id" do
        #authenticate!
        post=get_post
        post.update_attributes(params[:post])
        post.address.update_attributes(params[:address])
        image=post.images.last.update_attributes(image_params)

        present :status,"true"
        present :post,post,with: Api::Entities::PostEntity
        present :images_url, post.images.last.image.url
      end

      #method DELETE
      delete ":id" do
        get_post.destroy
        present "true"
      end
    end      

  end
end
