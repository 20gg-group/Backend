module Api::V1
  class CityApi < Grape::API
    resources :city do
      desc "Lấy danh sách thành phố "
      get do  
        city = City.all    
      end
      desc "Lấy danh sách huyện theo id thành phố "
      get ":id/district" do 
        District.where city_id: params[:id] 
      end
    end
  end
end
