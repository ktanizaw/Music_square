FactoryBot.define do
  factory :user do
    name { 'testuser1' }
    email { 'test@hoge.com' }
    profile { '宜しくお願い致します。' }
    password { 'password' }
  end
  factory :test_user, class: User do
    name { 'テストユーザー' }
    email { 'test@example.com' }
    profile { '私はテストユーザーです。' }
    password { 'password' }
  end
end
