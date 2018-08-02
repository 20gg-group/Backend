Rails.application.routes.draw do

root 'welcome#welcome_page'
	resources :users
	resources :posts
	#get 'posts#index'
  #devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Api::Api =>"/"
  mount GrapeSwaggerRails::Engine => '/swagger'
 # devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
