Rails.application.routes.draw do
  resources :users, only: [:show]

  devise_for :users

  # resources :bookings, only: [:destroy, :edit] do
  #   collection do
  #     get 'users/bookings', to: 'bookings#index'
  #   end
  # end

  resources :bookings, only: [:index, :destroy, :edit, :update]

  resources :products do 
    resources :bookings, only: [:new, :create]
  end

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
