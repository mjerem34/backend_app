# frozen_string_literal: true

FactoryBot.define do
  factory :opening_hour do
    association :shop
    day { (1..7).to_a.sample }
    opens { Faker::Time.between(from: Time.now - 3.hour, to: Time.now) }
    closes { Faker::Time.between(from: Time.now, to: Time.now + 3.hour) }
    valid_from { Faker::Time.between(from: DateTime.now - 3.days, to: DateTime.now) }
    valid_through { Faker::Time.between(from: DateTime.now, to: DateTime.now + 3.days) }
  end

  factory :shop do
    name { generate :shop_name }
  end
end
