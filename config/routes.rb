Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => {
   :registrations => 'users/registrations',
   :sessions => 'users/sessions',
   :omniauth_callbacks => 'users/omniauth_callbacks'
  }
  resources :artist_boards, only: [:index, :new] do
    resources :board_comments
    resources :events
    collection {get "search"}
  end
  resources :artist_boards, except: [:new, :index], param: :artists

  resources :events, only: :index do
    resources :event_comments
  end



  resources :users
  # resources :events
  # resources :board_comment, only: [:show, :create, :destroy]
  # resources :event_comment, only: [:create, :destroy]
  resources :relationships, only: [:show, :create, :destroy]
  resources :fans, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
  resources :participants, only: [:create, :destroy]
  resources :labellings, only: [:create, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
