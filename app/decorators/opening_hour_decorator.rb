class OpeningHourDecorator < ApplicationDecorator
  def formatted_hour
    day = I18n.t("wday.#{object.day}")
    hours = []

    object.shop.opening_hours.where(day: object.day).each do |opening_hour|
      hours << "#{opening_hour.opens.strftime('%H:%M')}-#{opening_hour.closes.strftime('%H:%M')}"
    end
    "#{day}: " + hours.join(', ')
  end
end
