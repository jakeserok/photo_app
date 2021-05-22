Rails.application.routes.draw do
  get 'home/index'
  
  resources :images
  resources :profiles
  devise_for :users 
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
