require('spec_helper')

describe('venue path', {:type => :feature}) do
  it('allows a user to add a new venue') do
    visit('/venues')
    expect(page).to have_content("You don't have any venues! Add some below.")
    fill_in('name', :with => "parking lot")
    click_button('Add')
    expect(page).to have_content('Parking Lot')
    expect(page).not_to have_content("You don't have any venues! Add some below.")
  end
end
