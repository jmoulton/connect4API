Rails.application.routes.draw do
  resources :moves, only: [:create]
  resources :games, only: [:create, :update]
end
