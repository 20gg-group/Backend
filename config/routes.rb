Rails.application.routes.draw do
<<<<<<< HEAD
  
  namespace :admin do
    root to: 'sessions#new'
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/', to: 'sessions#destroy'
    resources :users
    #devise_for :users
    resources :posts
  end
=======

root 'welcome#welcome_page'
	resources :users
	resources :posts
	#get 'posts#index'
  #devise_for :users
>>>>>>> tincms
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Api::Api =>"/"
  mount GrapeSwaggerRails::Engine => '/swagger'
 # devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
