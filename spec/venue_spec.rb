require('spec_helper')

describe(Venue) do
  describe('#bands') do
    it { should have_and_belong_to_many(:bands) }
  end

  describe('#create') do
    it('normalizes text') do
      new_venue = Venue.create({:name => "       the gorge "})
      expect(new_venue.name).to(eq("The Gorge"))
    end

    it('does not save a venue that has already been saved to the database') do
      new_venue = Venue.create({:name => "       the gorge "})
      new_venue2 = Venue.create({:name => " red rock      "})
      new_venue3 = Venue.create({:name => "    the gorge "})
      expect(Venue.all).to(eq([new_venue, new_venue2]))
    end
  end
end
