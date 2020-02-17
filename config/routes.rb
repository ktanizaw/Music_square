Rails.application.routes.draw do
  root 'users/registrations#new'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => {
   :registrations => 'users/registrations',
   :sessions => 'users/sessions',
   :omniauth_callbacks => 'users/omniauth_callbacks'
  }
  resources :artist_boards, only: [:index, :new] do
    resources :board_comments, only: [:create, :destroy]
    resources :events
    collection {get "search"}
  end
  resources :artist_boards, except: [:new, :index], param: :artists

  resources :events, only: :index do
    resources :event_comments, only: [:create, :destroy]
  end

  resources :users
  resources :relationships, only: [:create, :destroy]
  resources :fans, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
  resources :participants, only: [:create, :destroy]

  get 'contacts/new'
  post 'contacts/create'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
