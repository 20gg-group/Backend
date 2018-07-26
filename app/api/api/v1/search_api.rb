# module Api::V1
#   class SearchApi < Grape::API
#       #require 'ransack'
#       # helpers do
#       #   def search
#       #     @search ||= Post.search(params)
#       #   end      
#       # end    
#       namespace :search do
#         # method GET       
#         params do
#           optional :Search, type: String
#         end
#         get do
#           if params.blank?
#             present "Can't find anything!"
#           else
#             present Post.search(params)
#           end
#         end
#         # method POST        

#         # method PUT 
        
#         #method DELETE        
#       end      
    
#   end
# end