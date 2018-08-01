module Api::V1 
  class VoteApi < Grape::API

    helpers do   
      def get_post 
        Post.find(params[:post_id])
      end
    
    end
    resources :vote do
#==============================Get all post saved =========================
      desc "Lấy tất cả các Post đã lưu", {
        headers: {
          'Access-Token' => {
            description: 'Validates your identity',
            required: true
          }
        }
      }
      get do 
        authenticate!
        present :posts, current_user.votes.up.for_type(Post).votables, with: Api::Entities::PostEntity
      end
#================================Save Post================================
      desc "Lưu lại post yêu thích", {
        headers: {
          'Access-Token' => {
            description: 'Validates your identity',
            required: true
          }
        }
      }
      params do    
        requires :post_id , type: String 
      end
      post "/save" do 
        authenticate!

        get_post.liked_by current_user

        present "true"
      end
#==================================== Unsave=========================
      desc "Bỏ yêu thích post ", {
        headers: {
          'Access-Token' => {
            description: 'Validates your identity',
            required: true
          }
        }
      }
      params do   
        requires :post_id , type: String 
      end
      post "/unsave" do
        authenticate!
        get_post.disliked_by current_user 
      end

    end

  end
end
