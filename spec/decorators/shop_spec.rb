RSpec.describe ShopDecorator, type: :decorator do
  let(:open_shop) { create(:shop) }
  let(:closed_shop) { create(:shop) }
  before do
    create(:opening_hour, opens: Time.now - 1.hour, closes: Time.now + 2.hours, day: Time.now.wday, shop: open_shop)
    create(:opening_hour, day: Time.now.wday - 1, shop: closed_shop)
  end

  describe 'open?' do
    it { expect(open_shop.decorate.open?).to eq true }
    it { expect(closed_shop.decorate.open?).to eq false }
  end
end
