# frozen_string_literal: true

FactoryBot.define do
  factory :shop do
    name { generate :shop_name }
  end
end
