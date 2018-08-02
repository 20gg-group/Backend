Rails.application.routes.draw do
  #root 'welcome#welcome_page'
  namespace :admin do
    root 'sessions#new'
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/', to: 'sessions#destroy'
    resources :users
    #devise_for :users
    resources :posts
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Api::Api =>"/"
  mount GrapeSwaggerRails::Engine => '/swagger'
 # devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
