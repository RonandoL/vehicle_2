require('rspec')
require('dealership')
require('vehicles')  # so RSpec can use the Vehicle class to create a new vehicle in the test

describe('Dealership') do
  before() do
    Dealership.clear()
  end

# Class Methods -----------------------
  describe('.all') do
    it('returns the array of dealerships') do
      expect(Dealership.all()).to(eq([]))
    end
  end

  describe('.clear') do
    it('clears out saved dealerships in array') do
      Dealership.new("Kelly's Kars").save()
      Dealership.clear()
      expect(Dealership.all()).to(eq([]))
    end
  end

  describe('.find') do
    it('returns a dealership by its id number') do
      test_dealership = Dealership.new("Bob's Used Cars")
      test_dealership.save()
      test_dealership2 = Dealership.new("Jane's Cars")
      test_dealership2.save()
      expect(Dealership.find(test_dealership.id())).to(eq(test_dealership))
    end
  end

# Instance Methods -----------------------
  describe('#name') do
    it('returns name of the dealership from array') do
      test_dealership = Dealership.new("Bob's")
      expect(test_dealership.name()).to(eq("Bob's"))
    end
  end

  describe('#id') do
    it('returns id of the dealership') do
      test_dealership = Dealership.new("Bob's")
      expect(test_dealership.id()).to(eq(1))
    end
  end

  describe('#cars') do
    it('returns the array of cars') do
      test_dealership = Dealership.new("Bob's")
      expect(test_dealership.cars()).to(eq([]))
    end
  end



  describe('#save') do
    it('will add a dealership to array of dealerships') do
      test_dealership = Dealership.new("Bob's")
      test_dealership.save()
      expect(Dealership.all()).to(eq([test_dealership]))
    end
  end

      # will add a vehicle to the @cars array so we have a way to assign cars to dealerships
    describe('#add_vehicle') do
      it("adds a new vehicle to a dealership") do
        test_dealership = Dealership.new("Bob's Used Cars")
        test_vehicle = Vehicle.new("Toyota", "Prius", 2000)
        test_dealership.add_vehicle(test_vehicle)
        expect(test_dealership.cars()).to(eq([test_vehicle]))
      end
    end

end
