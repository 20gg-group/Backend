module Api::V1
  class CityApi < Grape::API
    resources :city do
      get do  
        city = City.all    
      end
      get ":id/district" do 
        District.where city_id: params[:id] 
      end
    end
  end
end
