Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/saved_routes", to: "pages#saved_routes"
  get "/updates", to: "pages#updates"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :routes, only: [:index, :show]

  resources :users, only: [:show] do
    resources :chatrooms, only: [:create]
  end

  resources :chatrooms, except: [:edit, :update, :new, :create] do
    resources :messages, only: :create
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
