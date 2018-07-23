module HttpCodesHelpers
  def unauthorized
    401
  end
end
require 'grape-swagger'
module Api
	class Api < Grape::API
		helpers  HttpCodesHelpers#,StatusHelpers
		format :json
		version 'v1'
		prefix :api

		rescue_from ActiveRecord::RecordNotFound do |e|
			error!(e,500)
		end
		#rescue_from :all
		
		# helpers do
    #   def authorize_user!
    #     error!("Token Invalid", 400) unless headers["Access-Token"].present?
    #     error!("Unauthorize", unauthorized) unless current_user
    #   end
    #   def current_user
    #     @current_user ||= User.find_by(confirmation_token: headers["Access-Token"])
    #   end
    # end
    helpers do 
      def authenticate!
        error!('Unauthorized. Invalid or expired token.', 401) unless current_user
      end

      def current_user
        # find token. Check if valid.
        token = ApiKey.where(access_token: params[:token]).first
        if token && !token.expired?
          @current_user = User.find(token.user_id)
        else
          false
        end
      end
    end
    
    mount V1::AuthApi
    

		# before do
    #   authorize_user!
    # end

    # mount V1::ProductApi
    add_swagger_documentation
	end
end