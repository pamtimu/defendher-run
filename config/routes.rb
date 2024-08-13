Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: "pages#home"
  get "/updates", to: "pages#updates"

  get "suggested_friends", to: "pages#suggested_friends"

  resources :saved_routes, except: [:update, :edit, :new, :create]
  resources :friendships


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :routes, only: [:index, :show] do
    member do
    get 'share', to: 'share_routes#share'
    post 'share_send', to: 'share_routes#share_send'
    end
    resources :saved_routes, only: [:create]
  end

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
