# frozen_string_literal: true

class OpeningHour < ApplicationRecord
  belongs_to :shop

  validates_presence_of :day, :closes, :opens, :shop_id
  validates_inclusion_of :day, in: 1..7

  validate :opens_before_closes
  validate :valid_from_before_valid_through

  validates_uniqueness_of :opens, scope: %i[shop_id day]
  validates_uniqueness_of :closes, scope: %i[shop_id day]

  scope :valid_opening_hours, lambda {
                                where(
                                  '? BETWEEN valid_from AND valid_through',
                                  Time.now
                                )
                              }
  scope :today_opening_hours, -> { where(day: Time.now.wday) }

  def opens_time
    opens.strftime('%H:%M')
  end

  def closes_time
    closes.strftime('%H:%M')
  end

  protected

  def opens_before_closes
    errors.add(:closes, I18n.t('errors.opens_before_closes')) if opens && closes && opens >= closes
  end

  def valid_from_before_valid_through
    errors.add(:valid_through, I18n.t('errors.valid_from_before_valid_through')) if valid_from && valid_through && valid_from >= valid_through
  end
end
