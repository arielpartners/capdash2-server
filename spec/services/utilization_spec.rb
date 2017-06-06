RSpec.describe Utilization do
  it 'raises an error on invalid group_by parameter' do
    params = { group_by: 'bananas' }
    utilization = Utilization.new(params)
    expect { utilization.calculate }.to raise_error(ArgumentError)
  end
end
