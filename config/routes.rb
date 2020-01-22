Rails.application.routes.draw do
  devise_for :users, :controllers => {
   :registrations => 'users/registrations',
   :sessions => 'users/sessions'
  }
  resources :users
  resources :artist_boards
  resources :events
  resources :event_comments
  resources :board_comments
  resources :relationships, only: [:create, :destroy]
  resources :fans, only: [:create, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
