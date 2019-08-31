# frozen_string_literal: true

class ShopDecorator < ApplicationDecorator
  def open?
    object.opening_hours.today_opening_hours.where(
      '? BETWEEN opens AND closes', Time.now
    ).valid_opening_hours.any?
  end
end
