RSpec.describe UtilizationService do
  it 'raises an error on invalid group_by parameter' do
    params = { group_by: 'bananas' }
    expect { UtilizationService.averages(params) }.to raise_error(ArgumentError)
  end
end
