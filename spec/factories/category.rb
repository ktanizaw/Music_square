FactoryBot.define do
  factory :category do
    name { 'カテゴリ１' }
  end
  factory :category_second, class: Category do
    name { 'カテゴリ２' }
  end
end
