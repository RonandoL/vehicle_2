require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/vehicles')

get('/') do
  erb(:index)
end

get('vehicles') do
  erb(:vehicles)
end
