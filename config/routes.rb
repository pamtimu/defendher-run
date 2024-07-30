Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/saved_routes", to: "pages#saved_routes"


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :routes, only: [:index, :show]
<<<<<<< HEAD

  resources :users, only: [:show]

=======
  resources :users, only: [:show]
>>>>>>> 12c1ed8a283861e1e0b5da89e2612bafe6be2afd
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
