Rails.application.routes.draw do
  resources :fans, only: [:create, :destroy]
end
