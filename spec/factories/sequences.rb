# frozen_string_literal: true

FactoryBot.define do
  def make_sequence(name, text: nil, format: nil)
    if format
      sequence name do |n|
        format % n
      end
    else
      sequence name do |n|
        "#{text || name}_#{n}"
      end
    end
  end

  make_sequence :shop_name
end
