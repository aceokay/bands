require('spec_helper')

describe(Venue) do
  describe('#bands') do
    it { should have_and_belong_to_many(:bands) }
  end
end
