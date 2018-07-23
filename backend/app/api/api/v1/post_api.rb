module Api::V1
    class PostApi < Grape::API

      get do
        "abc"
      end
      # helpers do
      #   def product
      #     @product ||= Product.find(params[:id])
      #   end
      # end
  
      # # GET
      # get do
      # Time.zone.now
      # 'hello'
      # end
      # resource :products do
      
      #   get ":id" do
      #     present Product.find(params[:id]), with: Api::Entities::Product
      #   end
  
      #   params do 
      #     requires :name,type: String
      #     requires :price,type: Float
      #     requires :description,type: String
      #   end
      #   post do
      #    Product.create!(declared(params))
      #    #{ 'declared_params' => declared(params, include_missing: true) }
      #   end
  
      #   params do 
      #     requires :name,type: String
      #     requires :price,type: Float
      #     requires :description,type: String
      #   end
      #   put ":id" do
      #     product.update_attributes(declared(params,include_missing: false))
      #     present product
      #   end
  
      #   delete ":id" do 
      #     product.destroy
      #     present "Destroy"
      #   end
      # end
    end
  end