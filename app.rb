require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/vehicles')

get('/') do
  erb(:index)
end

# All Vehicles Page
  get('/vehicles') do
    @vehicles = Vehicle.all()  # server collects all the vehicles (Vehicle.all)
    erb(:vehicles)
  end

# Vehicle Form Page
  get('/vehicles/new') do   # form to enter new vehicle, note URL route diff from form name
    erb(:vehicles_form)
  end
