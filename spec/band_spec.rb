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

    it('does not save a band that has already been saved to the database') do
      new_band = Band.create({:name => "       kendrick lamar "})
      new_band2 = Band.create({:name => "   kendrick lamar "})
      new_band3 = Band.create({:name => "       jay     rock  "})
      expect(Band.all).to(eq([new_band, new_band3]))
    end
  end
end
