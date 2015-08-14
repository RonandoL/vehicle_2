require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/vehicles')
require('./lib/dealership')

get('/') do
  erb(:index)
end

# Form and Success Page
    # Dealership Form Page, enter new dealership
    get('/dealerships/new') do
       erb(:dealerships_form)
    end

    # Create new dealership when form is submitted, same URL as all dealerships
    post('/dealerships') do  # data AND USER goes to /dealerships URL, user sees success.erb code
      name = params.fetch('name')
      Dealership.new(name).save()
      @dealerships = Dealership.all()
      erb(:success)
    end

# All Dealerships Page
get('/dealerships') do
  @dealerships = Dealership.all()
  erb(:dealerships)
end

# Single Dealership Page, after clicking link on all dealerships page
get('/dealerships/:id') do
  @dealership = Dealership.find(params.fetch('id').to_i())
  erb(:dealership)
end


get('/vehicles/:id') do
  @vehicle = Vehicle.find(params.fetch('id').to_i())
  erb(:vehicle)
end


get('/dealerships/:id/vehicles/new') do
    @dealership = Dealership.find(params.fetch('id').to_i())
    erb(:dealership_vehicles_form)
end

# # All Vehicles Page
#   get('/vehicles') do
#     @vehicles = Vehicle.all()  # server collects all the vehicles (Vehicle.all)
#     erb(:vehicles)
#   end
#
# # Vehicle Form Page, enter new vehicle
#   get('/vehicles/new') do   # user goes to /vehicles/new URL to fill out form
#     erb(:vehicles_form)
#   end
#
# # Create new vehicle when form is submitted
#   post('/vehicles') do   # data and user goes to /vehicles URL, user sees success.erb code
#     make = params.fetch('make')
#     model = params.fetch('model')
#     year = params.fetch('year')
#     vehicle = Vehicle.new(make, model, year)
#     vehicle.save()
#     erb(:success)
#   end
#
# # Single Vehicle Page, after clicking link on all vehicles page
# get('/vehicles/:id') do  # server uses id FROM THE PATH to find the requested vehicle
#   @vehicle = Vehicle.find(params.fetch("id").to_i())
#   erb(:vehicle)
# end
#       # The :id portion of this route will be the @id property of the vehicle object. For example, when we visit http://localhost:4567/vehicles/5, :id would refer to the 5.
#       # params.fetch('id') pulls the value of the :id from /vehicles/:id
#       # to search through all of the vehicles and return the vehicle object with that particular ID
#
#
#
# #
