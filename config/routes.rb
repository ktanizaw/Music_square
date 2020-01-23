Rails.application.routes.draw do
  devise_for :users, :controllers => {
   :registrations => 'users/registrations',
   :sessions => 'users/sessions'
  }
  resources :artist_boards do
    resources :board_comments
  end

  resources :users
  resources :events
  resources :relationships, only: [:create, :destroy]
  resources :fans, only: [:create, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
