module Api::V1
  class ImageApi < Grape::API
 
    helpers do 
      def image
        @image ||= Image.find(params[:id])
      end 
      def image_params      
        params[:image] = ActionDispatch::Http::UploadedFile.new(params[:image]) if params[:image].present?        
        ActionController::Parameters.new(params).permit(:image)
      end 
    end   
     
    resources :images do
      # method GET
      # namespace :post do
      #   get ":id" do # get addresses/advertisment/:id
      #     present Image.find_by post_id: params[:id]
      #   end
      # end
      get do      # using for test
        present Image.all
      end
      get ":id" do  #using for test
        
        image=Image.find(params[:id])
        present Image.find(params[:id])
        #present image.image.url 
      end

     
      # method POST
      params do
         #requires :image, :type => Rack::Multipart::UploadedFile, :desc => "Attachment File."
        requires :post_id , type: String 
        optional :attachments, type: Array do
          requires :image, :type => Rack::Multipart::UploadedFile
        end

      end
      post do
       
                 post=Post.find(params[:post_id])
       
        params#[:attachments]#.each do |i,op|
       
         # image=ActionDispatch::Http::UploadedFile.new(i[:image][1])
          # hash_image = {"image"=>image}
          # temp = post.images.new(hash_image)
          #temp.save!
        #end

         #hash_image = {"image"=>image}
         
         #  temp=post.images.new(hash_image)

      
      end
 
      #method PUT update image or v.v.
      params do
        requires :post_id,              type: Integer
        requires :image,            type: File      
      end   

      
      put ":id" do
        post=Post.find(params[:post_id])
        
        post.images.update_attributes(image_params)
        present post.images
      end   
      
      #method DELETE
      delete ":id" do
        image.destroy
        present "Destroyed"      
      end
    end
    
  end
 end