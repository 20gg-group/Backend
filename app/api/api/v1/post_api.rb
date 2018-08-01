module Api::V1
    class PostApi < Grape::API

    helpers do 
      def get_post
       @post = Post.find(params[:id])
      end
    end    

    resources :posts do
#==============================My Post================================
      desc "Lấy các post của User hiện tại", {
        headers: {
          'Access-Token' => {
            description: 'Validates your identity',
            required: true
          }
        }
      }
      get '/mypost' do  
        authenticate!
        present :posts, current_user.posts, with: Api::Entities::PostEntity
      end
#==============================All Post================================
      desc "Lấy tất cả các post"
      get do
        present :posts,Post.all ,with: Api::Entities::PostEntity
      end
#=========================Get 10 Post newest===========================
      desc "Lấy 10 post mới nhất"
      get 'newposts' do
        present Post.last(10) ,with: Api::Entities::PostEntity
      end
#=========================Get Post with ID=============================
      desc "Lấy post theo id"
      get ":id" do
        user = get_post.user 
        add = get_post.address
        image=get_post.images
        present :post,get_post,with: Api::Entities::PostEntity
        present :user,user, with: Api::Entities::UserEntity
        present :images_url,image ,with: Api::Entities::ImageEntity
      end

#==============================POST post================================  
      desc "Người dùng đăng post", {
        headers: {
          'Access-Token' => {
            description: 'Validates your identity',
            required: true
          }
        }
      }
      params do
          requires :post , type: Hash do
            requires :title,                         type: String
            optional :price,                          type: Float
            optional :area,                           type: Float
            optional :description,                     type: String
            optional :phone_contact_number,           type: String 
            optional :type_house,                     type: Integer
            optional :sex,                             type:Integer
            optional :quantity,                        type:Integer
            optional :detail_ids,                     type: Array[String]
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
      post do
        authenticate!
         post = current_user.posts.create!(params[:post])
         address = post.build_address(params[:address])
         address.save!

        #  image = post.images.new(image_params)
        #  image.save!

         params[:attachments].each do |attachment|
          image = ActionDispatch::Http::UploadedFile.new(attachment[:image])
          post.images.create!(image: image)
       end

          present :status ,"true"
          present :post , post ,with: Api::Entities::PostEntity
          present :images_url, post.images,with: Api::Entities::ImageEntity
        
      end     
#==============================Delete Post================================
      desc "Xóa post"
      delete ":id" do
        get_post.destroy
        present "true"
      end

    end      

  end
end
