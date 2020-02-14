FactoryBot.define do
  factory :board_comment do
    content { '掲示板コメント' }
    association :user, factory: :test_user
    association :artist_board, factory: :artist_board
  end
end
