Rails.application.routes.draw do
  devise_for :users
  root to: 'grandmoms#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :grandmoms do
    resources :bookings, only: [:index, :show, :new, :create, :destroy]
  end
end
