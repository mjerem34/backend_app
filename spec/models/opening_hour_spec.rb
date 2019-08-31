# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OpeningHour, type: :model do
  subject { build(:opening_hour) }

  it { is_expected.to belong_to(:shop) }

  it { is_expected.to validate_presence_of(:day) }
  it { is_expected.to validate_presence_of(:closes) }
  it { is_expected.to validate_presence_of(:opens) }
  it { is_expected.to validate_presence_of(:shop_id) }

  it { is_expected.to validate_uniqueness_of(:opens).scoped_to(%i[shop_id day]) }
  it { is_expected.to validate_uniqueness_of(:closes).scoped_to(%i[shop_id day]) }

  describe 'opens_before_closes' do
    it { expect(build(:opening_hour, opens: Time.now, closes: Time.now - 1)).not_to be_valid }
  end

  describe 'valid_from_before_valid_through' do
    it { expect(build(:opening_hour, valid_from: Time.now, valid_through: Time.now - 1)).not_to be_valid }
  end
end
