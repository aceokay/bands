require('spec_helper')

describe(Band) do
  describe('#venues') do
    it { should have_and_belong_to_many(:venues) }
  end

  describe('#create') do
    it('normalizes text') do
      new_band = Band.create({:name => "       kendrick lamar "})
      expect(new_band.name).to(eq("Kendrick Lamar"))
    end
  end
end
