module Api::V1
  class SearchApi < Grape::API          
    namespace :search do
      helpers do                            
        def search_post  
          if params[:max_price] && params[:min_price] 
              @p = Post.where("id IN (?) AND posts.price <= ? AND posts.price >= ?",@id ,params[:max_price] ,params[:min_price])           
          
            if params[:order] == 0
              present :posts,@p.order(:price).page(params[:page]).per(10),with: Api::Entities::PostEntity
            elsif params[:order]==1
              present :posts,@p.order(:price).reverse_order.page(params[:page]).per(10),with: Api::Entities::PostEntity
            elsif params[:order]==2
              present :posts,@p.order(:area).page(params[:page]).per(10),with: Api::Entities::PostEntity
            else 
              present :posts,@p.order(:area).reverse_order.page(params[:page]).per(10),with: Api::Entities::PostEntity
            end
            
          end 
          if params.has_key?(:max_price) && params.has_key?(:min_price) && params[:type_house]      
              @p = Post.where("id IN (?) AND posts.price <= ? AND posts.price >= ? AND posts.type_house = ? ",@id ,params[:max_price] ,params[:min_price] ,params[:type_house])
          
          if params[:order] == 0
            present :posts,@p.order(:price).page(params[:page]).per(10),with: Api::Entities::PostEntity
          elsif params[:order]==1
            present :posts,@p.order(:price).reverse_order.page(params[:page]).per(10),with: Api::Entities::PostEntity
          elsif params[:order]==2
            present :posts,@p.order(:area).page(params[:page]).per(10),with: Api::Entities::PostEntity
          else 
            present :posts,@p.order(:area).reverse_order.page(params[:page]).per(10),with: Api::Entities::PostEntity
          end
        
          end
        end       
      end    
      # method GET
      namespace :search_multi do       
        params do       
          optional :city,         type: String
          optional :district,     type: String
          optional :min_price,    type: Float
          optional :max_price,    type: Float 
          optional :type_house,   type: Integer     
          optional :order ,       type: Integer
          requires :page ,        type: Integer      
        end
        get do
          if params[:city] && params[:district]
            @id = []        
            arr = Address.where(city: params[:city], district: params[:district])
            arr.each do |i|            
              @id.push(i.post_id)           
            end   
            search_post
          end         
          if params[:city]
            @id = []        
            arr = Address.where(city: params[:city])
            arr.each do |i|            
              @id.push(i.post_id)           
            end   
            search_post
          end          
          if params[:district]
            @id = []        
            arr = Address.where(district: params[:district])
            arr.each do |i|            
              @id.push(i.post_id)           
            end   
            search_post
          else 
            @id = []        
            arr = Address.all
            arr.each do |i|            
              @id.push(i.post_id)           
            end   
            search_post  
          end                     
        end
      end
      # get posts  - type house
      namespace :search_type_house do       
        params do          
          optional :type_house, type: Integer
          requires :page , type: Integer           
        end
        get do   
          
          @pos = Post.where("posts.type_house = ? " ,params[:type_house])
          present :posts,@pos.page(params[:page]).per(10),with: Api::Entities::PostEntity   # Tin viet    
          
        end
      end
    end     
  end
end