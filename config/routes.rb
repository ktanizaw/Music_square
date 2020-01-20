Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :users
  resources :artist_boards

  resources :fans, only: [:create, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
