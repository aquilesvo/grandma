Rails.application.routes.draw do
  devise_for :users
  root to: 'grandmoms#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :grandmoms do
    resources :bookings, only: [:show, :new, :create, :destroy]
  end
  resources :bookings, only: [:index]

  resources :users, only: [:show, :edit, :update, :destroy]
  patch '/userphoto/:id', to: 'users#remove_photo', as: 'user_photo'
end
