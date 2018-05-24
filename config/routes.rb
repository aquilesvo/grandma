Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :grandmoms do
    resources :bookings, only: [:show, :new, :create, :destroy]
  end
  resources :bookings, only: [:index]

  patch 'accept/:id', to: 'bookings#accept', as: 'accept'
  patch 'decline/:id', to: 'bookings#decline', as: 'decline'

  resources :users, only: [:show, :edit, :update, :destroy]
  patch '/userphoto/:id', to: 'users#remove_photo', as: 'user_photo'
end
