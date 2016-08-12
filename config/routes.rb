Rails.application.routes.draw do

  get '/health_check', to: redirect('/health_check.html')

  post '/add_to_cart/:catalog_item' => 'carts#add_to_cart', :as => 'add_to_cart'

  resources :security_questions
  resources :orders
  resources :catalog_items
  resource :cart, only: [:show]
  resources :order_items

  devise_for :users, controllers: {registrations: 'registrations'}
  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
