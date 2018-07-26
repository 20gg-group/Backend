module Api::V1
  class LogoutApi < Grape::API
    delete :logout do 
      api_key.destroy
      present "Destroyed"
    end  
  end
end

  