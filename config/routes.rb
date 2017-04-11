Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :sessions
  resources :places do 
    resources :recomendations
    get 'new_tweet', to: 'places#new_tweet'  
  end 
  
  root 'places#index'
  get '/auth/:provider/callback', to: 'sessions#create'

  get 'sign_out', to: 'sessions#destroy', as: :sign_out

end
