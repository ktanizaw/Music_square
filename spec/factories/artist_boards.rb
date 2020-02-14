FactoryBot.define do
  factory :artist_board do
    artists { 'テストバンド' }
    albums { 'テストアルバム' }
    profiles { 'テストプロフィール' }
    icon { 'test1.jpeg' }
  end
  factory :artist_board_second, class: ArtistBoard do
    artists { 'テストグループ' }
    albums { 'テストアルバム２' }
    profiles { 'テストプロフィール２' }
    icon { 'test2.jpeg' }
  end
end
