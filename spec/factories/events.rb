FactoryBot.define do
  factory :event do
    title { '交流会' }
    place { '東京' }
    date { '2020-12-30 00:00:00' }
    content { '交流しましょう' }
    deadline { '2020-02-12 00:13:00' }
    capacity { 1 }
    association :owner, factory: :user
    association :artist_board, factory: :artist_board
    after(:create) do |event|
          create_list(:label, 1, events: [event])
    end
  end
  factory :event_second, class: Event do
    title { 'ライブ参戦' }
    place { '大坂' }
    date { '2020-12-20 00:00:00' }
    content { 'ライブ行きましょう' }
    deadline { '2020-02-02 00:13:00' }
    capacity { 2 }
    association :owner, factory: :test_user
    association :artist_board, factory: :artist_board_second
    after(:create) do |event|
          create_list(:label_second, 1, events: [event])
    end
  end
end
