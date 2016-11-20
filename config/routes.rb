Rails.application.routes.draw do
  resources :moves, only: [:create]
end
