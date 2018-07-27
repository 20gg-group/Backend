module Api::V1
  class SearchApi < Grape::API      
    namespace :search do
      # method GET       
      # params do
      #   optional :tittle, type: String
      # end
      get do               
          present Post.searcher_post("nha")
          #present "Done"
        
      end
        # method POST
        # method PUT         
        # method DELETE        
    end      
    
  end
end