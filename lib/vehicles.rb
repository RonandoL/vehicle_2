class Vehicle
  @@vehicles = [] # to store all of the vehicles in an array
    # @@ is a class variable. Think of it as a property that is saved on the class itself

# Class Methods -------------------
      # A method that gets called on the class itself, rather than on an instance of that class is known as a class method.
      # used when you want to do something that involves more than one instance
      # Class methods are written ClassName.method in both documentation and in code, but instance methods are written ClassName#method in documentation and ObjectName.method() in code

  define_singleton_method(:all) do
    @@vehicles
  end

  define_singleton_method(:clear) do
    @@vehicles = []
  end

      # we can write a class method that will find this vehicle by its ID. We want to use a class method because we need to search through all of the instances of Vehicle to find the one we want
  define_singleton_method(:find) do |identification|
    found_vehicle = nil
    @@vehicles.each() do |vehicle|
      if vehicle.id().eql?(identification.to_i())  # convert identification string to integer
        found_vehicle = vehicle
      end
    end
    found_vehicle
  end

# Instance Methods -------------------

  define_method(:initialize) do |make, model, year|
    @year = year      # instance variable, to be used in other methods like .age
    @make = make
    @model = model
    @id = @@vehicles.length().+(1)
  end   # create a ID by grabbing length of the @@vehicles array and adding 1 to it

  define_method(:age) do
    current_year = Time.new().year()
    current_year.-(@year)
  end

  define_method(:worth_buying) do
    american_cars = ["Chrysler", "Ford", "GM"]
    american = american_cars.include?(@make)
    new_enough = self.age().<=(15)  # only take cars <= 15 years old
    american.&(new_enough)  # it is both
  end

  define_method(:make) do
    @make
  end

  define_method(:model) do
    @model
  end

  define_method(:year) do
    @year
  end

  define_method(:save) do
    @@vehicles.push(self)
  end

  define_method(:id) do
    @id
  end






end
