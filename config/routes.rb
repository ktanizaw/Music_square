Rails.application.routes.draw do
  resources: users
  resources: artist_boards
  resources: board_comments
  resources: categories
  resources: event_comments
  resources: fans
  resources: favorites
  resources: labels
end
