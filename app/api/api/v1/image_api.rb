# module Api::V1
#   class ImageApi < Grape::API
 
#     helpers do 
    
#       def image
#         @image ||= Image.find(params[:id])
#       end 
#       def image_params      
#         params[:image] = ActionDispatch::Http::UploadedFile.new(params[:image]) if params[:image].present?        
#         ActionController::Parameters.new(params).permit(:image)
#       end 
#     end   
     
#     resources :images do
      
    
#       desc "Update user's information", {
#         headers: {
#           'Access-Token' => {
#             description: 'Validates your identity',
#             required: true
#           }
#         }
#       }
      
#       get do      # using for test
#         present Image.all
#       end
#       get ":id" do  #using for test
#         image=Image.find(params[:id])
#         present Image.find(params[:id])
#       end
     
#       # method POST


#       params do
#          #requires :image, :type => Rack::Multipart::UploadedFile, :desc => "Attachment File."
#         requires :post_id , type: Integer
#         optional :attachments, type: Array do
#           requires :image, type: File
#         end
#       end
#       post do
#           post=Post.find(params[:post_id])
#           params[:attachments].each do |attachment|
#             image = ActionDispatch::Http::UploadedFile.new(attachment[:image])
#             post.images.create!(image: image)
#           end
#       end
 
#       #method PUT update image or v.v.
#       params do
#         requires :post_id,              type: Integer
#         requires :image,            type: File      
#       end   

      
#       put ":id" do
#         post=Post.find(params[:post_id])
        
#         post.images.update_attributes(image_params)
#         present post.images
#       end   
      
#       #method DELETE
#       delete ":id" do
#         image.destroy
#         present "Destroyed"      
#       end
#     end
    
#   end
#  end