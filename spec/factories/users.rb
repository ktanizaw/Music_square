FactoryBot.define do
  factory :user do
    name { 'testuser1' }
    email { 'test@hoge.com' }
    profile { '宜しくお願い致します。' }
    password { 'password' }
  end
end
