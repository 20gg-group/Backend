module Api::V1 
  class VoteApi < Grape::API
    resources :vote do
      get do 
        'test'
      end
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
      post do 
        authenticate!
        post=Post.find(params[:post_id])
        post.liked_by current_user
        present "true"
      end
    end

  end
end
