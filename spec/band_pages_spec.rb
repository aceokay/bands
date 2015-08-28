require('spec_helper')

describe('band path', {:type => :feature}) do
  it('allows a user to add a new band') do
    visit('/')
    expect(page).to have_content("You don't have any bands! Add some below.")
    fill_in('name', :with => "pepper")
    click_button('Add')
    expect(page).to have_content('Pepper')
    expect(page).not_to have_content("You don't have any bands! Add some below.")
  end

  it('allows the user to visit a specific band and add a venue association') do
    visit('/')
    fill_in('name', :with => "salt")
    click_button('Add')
    expect(page).to have_content('Salt')
    click_link('All Venues')
    fill_in('name', :with => "Yellowknife")
    click_button('Add')
    visit('/')
    click_link('Salt')
    select('Yellowknife', from: 'venue_id')
    click_button('Submit')
    expect(page).to have_content('Yellowknife')
  end

  it('allows the user to visit a specific band and edit the name of the band') do
    visit('/')
    fill_in('name', :with => "peter")
    click_button('Add')
    click_link('Peter')
    fill_in('name', :with => "paul")
    click_button('Update')
    expect(page).to have_content('Paul')
    expect(page).not_to have_content('Peter')
  end
end
