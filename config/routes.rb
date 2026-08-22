Rails.application.routes.draw do
  get "bookmarks/show"
  get "bookmarks/create"
  get "bookmarks/new"
  get "bookmarks/destroy"
  get "movies/index"
  get "movies/show"
  get "movies/create"
  get "movies/new"
  get "movies/destroy"
  get "movies/update"
  get "movies/edit"
  get "lists/index"
  get "lists/show"
  get "lists/create"
  get "lists/new"
  get "lists/destroy"
  get "lists/update"
  get "lists/edit"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "lists#index"
  resources :lists, except: [ :index ] do
    resources :movies, except: [ :show ]
    resources :bookmarks, only: [ :new, :create ]
  end
  resources :bookmarks, only: [ :destroy ]
end
