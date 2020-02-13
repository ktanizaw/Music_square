FactoryBot.define do
  factory :event do
    title { '交流会' }
    place { '東京' }
    date { '2020-12-30 00:00:00' }
    content { '交流しましょう' }
    deadline { '2020-02-12 00:13:00' }
    capacity { 1 }
  end
end
