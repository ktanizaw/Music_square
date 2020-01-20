Rails.application.routes.draw do
  resources :users
  resources :fans, only: [:create, :destroy]
end
