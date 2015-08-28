require("bundler/setup")
require('pry')
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @bands = Band.all()
  erb(:index)
end

get('/bands') do
  redirect('/')
end

get('/venues') do
  @venues = Venue.all()
  erb(:venue_list)
end

get('/bands/:id') do
  band_id = params.fetch('id').to_i()
  @band = Band.find(band_id)
  @venues = Venue.all()
  erb(:band_info)
end

post('/bands/add') do
  band_name = params.fetch('name')
  Band.create({:name => band_name})
  redirect back
end

post('/venues/add') do
  venue_name = params.fetch('name')
  Venue.create({:name => venue_name})
  redirect back
end

post('/bands/:id/venues/add') do
  band_id = params.fetch('id').to_i()
  band = Band.find(band_id)
  venue_id = params.fetch('venue_id').to_i()
  venue = Venue.find(venue_id)
  band.venues().push(venue)
  redirect back
end

patch('/bands/:id/update') do
  band_id = params.fetch('id').to_i()
  band = Band.find(band_id)
  new_name = params.fetch('name')
  band.update({:name => new_name})
  redirect back
end

delete('/bands/:id/delete') do
  band_id = params.fetch('id').to_i()
  band_to_delete = Band.find(band_id)
  band_to_delete.destroy()
  redirect back
end

delete('/venues/:id/delete') do
  venue_id = params.fetch('id').to_i()
  venue_to_delete = Venue.find(venue_id)
  venue_to_delete.destroy()
  redirect back
end
