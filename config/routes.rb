Rails.application.routes.draw do

  get '/health_check', to: redirect('/health_check.html')
  resources :security_questions
  resources :order_items
  resources :orders
  resources :catalog_items
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]

  devise_for :users, controllers: {registrations: 'registrations'}
  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
