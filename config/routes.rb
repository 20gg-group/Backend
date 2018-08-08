Rails.application.routes.draw do
  #root 'welcome#welcome_page'
  namespace :admin do
    root 'sessions#new'
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/', to: 'sessions#destroy'
    resources :users
    resources :account_activations, only: [:edit]
    resources :posts
  end
  mount Api::Api =>"/"
  mount GrapeSwaggerRails::Engine => '/swagger'
end
