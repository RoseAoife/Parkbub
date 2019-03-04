FactoryBot.define do
    factory :parking_space do |f|
      f.name "Student Parking"
      f.cost "13.50"
      f.address "32 Thomas St."
      f.description "Safe parking near student living"
      f.user_id "1"
    end
end