json.data do
  json.array!(@shops.map(&:decorate)) do |shop|
    json.type 'Shop'
    json.id shop.id
    json.attributes do
      json.name shop.name
      json.open shop.open?
    end
    json.relationships do
      json.opening_hours do
        json.array!((1..7).to_a.sort_by { |n| ((n + 7 - Time.now.wday) % 7) }) do |i|
          hour = shop.opening_hours.valid_opening_hours.where(day: i).uniq { |h| h.day }.first
          if hour == nil
            json.id i
            json.is_today i == Time.now.wday
            json.formatted_hour t("wday.#{i}") + ': '+ t('opening_hours.closed')
          else
            json.id hour.id
            json.is_today hour.day == Time.now.wday
            json.formatted_hour hour.decorate.formatted_hour
          end
        end
      end
    end
  end
end
