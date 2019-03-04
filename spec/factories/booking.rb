FactoryBot.define do
    factory :booking do |f|
      f.start_time "2012, 8, 29, 22, 35, 0"
      f.end_time "2013, 8, 29, 22, 35, 0"
      f.price "12.50"
      f.parking_space_id "1"
      f.user_id "1"
    end
end