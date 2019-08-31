RSpec.describe 'Shop', type: :request do
  it { expect(get('/api/v1/shops')).to eq 200 }
end
