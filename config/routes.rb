Rails.application.routes.draw do
  get 'profile', to: 'users#show'
  devise_for :users

  # resources :bookings, only: [:destroy, :edit] do
  #   collection do
  #     get 'users/bookings', to: 'bookings#index'
  #   end
  # end
  resources :bookings, only: [:index, :destroy, :edit, :update]

  get '/bookings/:id/validate', to: 'bookings#accept', as: 'booking_accept'
  get '/bookings/:id/cancelled', to: 'bookings#cancelled', as: 'booking_refuse'

  resources :products do
    resources :reviews, only: [:new, :create]
    resources :bookings, only: [:new, :create]
  end

  get '/myproducts', to: 'pages#product', as: 'my_products'

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
