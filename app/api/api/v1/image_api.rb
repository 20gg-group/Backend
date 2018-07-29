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
          #requires :post_id,                type: Integer
         # optional :image,               type: File        
         requires :image, :type => Rack::Multipart::UploadedFile, :desc => "Attachment File."

         requires :post_id , type: String 
        # optional :attachments, type: Array do
        #   requires :image, :type => Rack::Multipart::UploadedFile, :desc => "Profile pictures."
        # end

      end
      post do
        #params
      #params[:attachments][1]
        
       # params[:attachments].each do |i|
          #image = ActionDispatch::Http::UploadedFile.new(i)
          #ActionController::Parameters.new(params).permit(:image)  
          
          #attachment.file = ActionDispatch::Http::UploadedFile.new(params[:file])
          #attachment.save!
        #end
   
      
           post=Post.find(params[:post_id])
           ActionDispatch::Http::UploadedFile.new(params[:image])
          # params_imagess=ActionDispatch::Http::UploadedFile.new(params[:image])
          # ActionController::Parameters.new(params_imagess).permit(:image)
          #image_params
          #params_imagess[:image]
          #image = post.images.new()
        #  if image.save
        #   present :status,"true"
        #   present :image_url,image.image.url
        # else
        #   present status: "false"
        # end
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