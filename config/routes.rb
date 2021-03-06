Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :vets do
    resources :reviews, only: :create
  end
  get '/profile',    to: 'profile#index'
  resources :profile
end
