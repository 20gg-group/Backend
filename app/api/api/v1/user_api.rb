module Api::V1
  class UserApi < Grape::API

    helpers do   

      def access_token(user)
        api_key=user.api_keys.create
        api_key.access_token
      end

      def user_params      
        params[:avatar] = ActionDispatch::Http::UploadedFile.new(params[:avatar]) if params[:avatar].present?        
        ActionController::Parameters.new(params).permit(:full_name,:phone_number,:avatar)
      end 

    end
    resources :users do
#==============================Test==================================
      desc "Đăng nhập bằng email"
      params do
        requires :email, type: String
        requires :password, type: String
      end
      post "/sign_in" do
        user = User.find_by(email: params[:email])

        if user.nil? 
          {
            status: "false",
            error!: "User not found"
          } 
        elsif user.valid_password?(params[:password]) && user.activated == true
          # if user.activated == false
          #   {
          #     status:"false",
          #     error!:"The account has not been activated"
          #   }
          # else
            {
              status: "true",
              access_token: access_token(user)
            }
          #end
        else
          {
            status: "false",
            error!: "Invalid email or password"
          }
        end
      end
#============================Sign in with GG==================================
      desc "Đăng nhập băng Google"
      params do
        requires :full_name, type: String 
        requires :email, type: String
        
      end
      post "/sign_in_with_google" do  
        user=User.find_by(email: params[:email])
        if user 
          {
            status: "true",
            access_token: access_token(user)
          }
        else
          user = User.create!(email: params[:email],
            password: Devise.friendly_token[0,20],
            full_name: params[:full_name],
            activated: true,
            activated_at: Time.now
          )
          {
            status: "true",
            access_token: access_token(user)
          }
        end   
      end
#================================Sign out==================================
      desc "Đăng xuất", {
        headers: {
          'Access-Token' => {
            description: 'Validates your identity',
            required: true
          }
        }
      }
      delete '/sign_out' do 
        authenticate!
        api_key.destroy # Tim api_key theo Token
        {
          status:"true",
        }
      end  
#=================================Sign up==================================
      desc "Đăng ký" 
      params do
        requires :full_name, type: String 
        requires :email, type: String
        requires :password, type: String
        requires :phone_number , type: String
      end
      post '/sign_up' do
        user=User.find_by(email: params[:email])
        if user 
          {
            status: "false",
            error!: "Email has already been taken"
          }
        else 
          @user = User.create!(declared(params))
          @user.create_activation_digest
          @user.sent_account_activate_mail
            {
              status:"true"
            }
        end
      end
#=====================Account Activate===================================
      desc "Nhập mã xác nhận tài khoản"
      params do 
        requires :email, type: String
        requires :activation_code,type: String
      end
      get "/auth" do 

        user=User.find_by(email: params[:email])
        if user.activate_expired?
          return present({ status:"false",error!: 'account activate has expired'})
        end

        if user.valid_activation_code?(params[:activation_code])

          user.update!(activated: true,activated_at: Time.now)
          {
            status: "true",
            access_token: access_token(user)
          }
        else
          {
            status:"false",
            error!: 'Invalid account activation code' 
          }
        end
      end



#=====================Get user's infomation==============================
      desc "Lấy thông tin của User", {
        headers: {
          'Access-Token' => {
            description: 'Validates your identity',
            required: true
          }
        }
      }
      get "/info" do
        authenticate! 
        present :user,current_user ,with: Api::Entities::UserEntity
      end
#===========================Update User's Information===============================

      desc "Update thông tin User", {
        headers: {
          'Access-Token' => {
            description: 'Validates your identity',
            required: true
          }
        }
      }
      params do  
        optional :full_name, type: String 
        optional :phone_number, type: String
        optional :avatar, type: File
      end
      put do
        authenticate!
        current_user.update_attributes!(user_params)
        present :status,"true"
        present :user,current_user,with: Api::Entities::UserEntity
      end
#==========================Change password===================

      desc "Đổi mật khẩu", {
        headers: {
          'Access-Token' => {
            description: 'Validates your identity',
            required: true
          }
        }
      }
      params do  
        requires :password      ,type: String
        requires :new_password  ,type: String
      end
      put "/password" do 
        authenticate!
        if current_user.valid_password?(params[:password])
          newpass = params[:new_password]
          current_user.reset_password(newpass,newpass)
          {status: "true"}
        else 
          {
            status: "false",
            error!: "Invalid password" 
          }
        end
      end
    end
  end
end