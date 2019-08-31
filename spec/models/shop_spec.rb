RSpec.describe Shop, type: :model do
  subject { build(:shop) }

  it { is_expected.to have_many(:opening_hours) }
end
