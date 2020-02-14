FactoryBot.define do
  factory :artist_board do
    artists { 'テストバンド' }
    albums { 'テストアルバム' }
    profiles { 'テストプロフィール' }
    icon { 'test1.jpeg' }
    after(:create) do |artist_board|
          create_list(:category, 1, artist_boards: [artist_board])
    end
  end
  factory :artist_board_second, class: ArtistBoard do
    artists { 'テストグループ' }
    albums { 'テストアルバム２' }
    profiles { 'テストプロフィール２' }
    icon { 'test2.jpeg' }
    after(:create) do |artist_board|
          create_list(:category_second, 1, artist_boards: [artist_board])
    end
  end
end
