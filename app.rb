require("bundler/setup")
require('pry')
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @bands = Band.all()
  erb(:index)
end

post('/bands/add') do
  band_name = params.fetch('name')
  Band.create({:name => band_name})
  redirect back
end
