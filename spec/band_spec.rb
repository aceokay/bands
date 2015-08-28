require('spec_helper')

describe(Band) do
  describe('#venues') do
    it { should have_and_belong_to_many(:venues) }
  end
end
