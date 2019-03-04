FactoryBot.define do
    factory :user do |f|
      f.username "test"
      f.password "123456789"
      f.email "test@gmail.com"
    end
end