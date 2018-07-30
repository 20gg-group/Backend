module Api::V1
    class PostApi < Grape::API

    helpers do 
      def get_post
       @post = Post.find(params[:id])
      end

    end    

    resources :posts do

      desc "Get all post of user", {
        headers: {
          'Access-Token' => {
            description: 'Validates your identity',
            required: true
          }
        }
      }
      get 'mypost' do  
        authenticate!
        present :posts, current_user.posts, with: Api::Entities::PostEntity
        present :images_url,image ,with: Api::Entities::ImageEntity
      end
  
      desc "Get all post"
      get 'allposts' do
        present :posts,Post.all ,with: Api::Entities::PostEntity #, except: [:tittle]
      end

      desc "Get post with id "
      get ":id" do
        user = get_post.user 
        add = get_post.address
        image=get_post.images
        present :post,get_post,with: Api::Entities::PostEntity
        present :user,user, with: Api::Entities::UserEntity
        present :address,add,with: Api::Entities::AddressEntity
        present :images_url,image ,with: Api::Entities::ImageEntity
      end
    
      desc "current user POST a post", {
        headers: {
          'Access-Token' => {
            description: 'Validates your identity',
            required: true
          }
        }
      }
      params do
          requires :post , type: Hash do
            requires :tittle,                         type: String
            optional :price,                          type: Float
            optional :area,                           type: Float
            optional :decription,                     type: String
            optional :phone_contact_number,           type: String 
            optional :type_house,                     type: Integer
            #optional :detail_ids,                     type: Array[Integer]
          end        
          requires :address, type: Hash do
            requires :city, type: String
            requires :district ,type: String
            optional :add_detail, type: String
          end           
          #requires :image, :type => File  # Up 1 image
          optional :attachments, type: Array do  # Up nhieu image
            requires :image, :type => File
          end  
      end
      post do
        authenticate!
         post = current_user.posts.create!(params[:post])
         address = post.build_address(params[:address])
         address.save!
         #image = post.images.new(image_params)
         #image.save!

         params[:attachments].each do |attachment|
          image = ActionDispatch::Http::UploadedFile.new(attachment[:image])
          post.images.create!(image: image)
          
        end

          present :status ,"true"
          present :post , post ,with: Api::Entities::PostEntity
          present :images_url, post.images,with: Api::Entities::ImageEntity
        
      end     

      desc "current user POST a post", {
        headers: {
          'Access-Token' => {
            description: 'Validates your identity',
            required: true
          }
        }
      }
      params do
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
          optional :attachments, type: Array do  # Up nhieu image
            requires :image, :type => File
          end       
      end
      put ":id" do
        authenticate!
        post =get_post
        post.update_attributes(params[:post])
        post.address.update_attributes(params[:address])
       # image=post.images.last.update_attributes(image_params)

        present :status,"true"
        present :post,post,with: Api::Entities::PostEntity
        #present :images_url, post.images.last.image.url
      end

      #method DELETE
      delete ":id" do
        get_post.destroy
        present "true"
      end
    end      

  end
end
