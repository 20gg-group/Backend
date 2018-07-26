module Api::V1
    class AuthApi < Grape::API
  
      namespace :auth do
        # ---------------------Sign-in-------------------------
        desc "API for sign-in" do
          #success Api::Entities::UserEntity
        end
        params do
          requires :email, type: String
          requires :password, type: String
        end
        post :sign_in do
          user = User.find_by(email: params[:email])
          raise ActiveRecord::RecordNotFound.new("User not found") unless user
          if user.valid_password?(params[:password])
            {
              status: "true",
              user: user
            }
          else
          {
            status: "false",
            error!: "Invalid email or password"
          }
          end
        end
        #-------------------Sign in with google---------------------


        params do 
        requires :email, type: String
        end

        post :gg do 
   
          { 'declared_params' => declared(params) }
          
            #@user = User.from_omniauth(request.env['omniauth.auth'])
              @user=User.from_omniauth(params[:email])
            # if @user.persisted?
            #   flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
            #   sign_in_and_redirect @user, event: :authentication
            # else
            #   session['devise.google_data'] = request.env['omniauth.auth'].except(:extra) # Removing extra as it can overflow some session stores
            #   redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
            # end
    
        
        end


        # ---------------------Sign-up-------------------------
        desc "API for sign-up" do
         success Api::Entities::UserEntity
        end
        params do
         requires :full_name, type: String
         requires :email, type: String
         requires :password, type: String
         requires :phone_number , type: String
        end
        post :sign_up do
         user = User.create!(declared(params))
         {
           status: "true",
           access_token: access_token(user)
         }
        end
        
        #----------Test-----------------
        desc "API for view all user"
        get :user_all do
          present User.all #, with: Api::Entities::UserEntity
        end
      end
    end
  end