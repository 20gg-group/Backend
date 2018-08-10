Rails.application.routes.draw do
# CMS
  namespace :admin do
    root 'sessions#new'
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/', to: 'sessions#destroy'
    resources :users
    resources :posts
  end
  # API endpoints
  mount Api::Api =>"/"
  # API document
  mount GrapeSwaggerRails::Engine => '/swagger'
end
