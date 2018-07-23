module Api::V1
  class ImageApi < Grape::API

    helpers do    

      def image
        @image ||= Image.find(params[:id])
      end

      def image_params      
        params[:image] = ActionDispatch::Http::UploadedFile.new(params[:image]) if params[:image].present?        
        ActionController::Parameters.new(params).permit(:post_id, :image)
      end   

    end    
    resources :images do
      # method GET
      namespace :post do
        get ":id" do # get addresses/advertisment/:id
          present Image.find_by post_id: params[:id] 
        end
      end
      get do      # using for test
        present Image.all
      end
      get ":id" do  #using for test
        present Image.find(params[:id])
      end

      # method POST
      params do 
        optional :post_id, type: Integer
        given :post_id do
           optional :image,    type: File         
        end 
      end    

      post do
        # post advertisment 
        image = Image.new(image_params)
        if image.save
          present data: {
            post_id: image.post_id,
            id: image.id,
            image_url: image.image.url            
          }
        else
          present message: "fail"
        end
      end

      # method PUT 
      # params do
      #   requires :title_post, type: String
      #   requires :price, type: Float 
      # end
      # put ":id" do
      #   adver.update_attributes(declared(params))
      #   present adver
      # end

      #method DELETE
      delete ":id" do
        image.destroy
        present "Destroyed"
      end
    end
    
  end
end