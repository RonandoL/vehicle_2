require('rspec')
require('vehicles')

describe('Vehicle') do
	before() do
		Vehicle.clear()
	end

	# write a ClassName.clear method to clear the @@all_tasks array between each spec run. You must call that method at the beginning of your spec file to clear out the array every time the spec file runs

# Class Specs -------------------
	describe(".all") do
		it("is empty at first") do
			expect(Vehicle.all()).to(eq([]))
		end
	end

	describe('.clear') do
		it('clears the array between specs') do
			Vehicle.new("Toyota", "Prius", 2000).save()
			Vehicle.clear()
			expect(Vehicle.all()).to(eq([]))
		end
	end

	describe('.find') do
		it('will find and return vehicle by unique id in array of vehicles') do
			test_vehicle = Vehicle.new("Toyota", "Prius", 2000)
			test_vehicle.save()
			test_vehicle2 = Vehicle.new("Ford", "Escort", 2000)
			test_vehicle2.save()
			expect(Vehicle.find(test_vehicle2.id())).to(eq(test_vehicle2))
		end   # class method called on class, with test vehicle argument with .id method called on it
	end

# Instance Specs -------------------
	describe('#age') do
		it("returns the vehicles age") do
      test_vehicle = Vehicle.new("Toyota", "Prius", 2000)
      expect(test_vehicle.age()).to(eq(15))
    end
	end

	describe('#worth_buying') do
		it('retrurns false if vehicle is not American or is younger than 15 years') do
			test_vehicle = Vehicle.new("Toyota", "Prius", 2000)
			expect(test_vehicle.worth_buying()).to(eq(false))
		end
	end

# Instance Attribute Specs -------------------
	describe('#make') do
		it('returns the make of the vehicle') do
			test_vehicle = Vehicle.new("Toyota", "Prius", 2000)
			expect(test_vehicle.make()).to(eq("Toyota"))
		end
	end

	describe('#model') do
		it('returns the model of the vehicle') do
			test_vehicle = Vehicle.new("Toyota", "Prius", 2000)
			expect(test_vehicle.model()).to(eq("Prius"))
		end
	end

	describe('#year') do
		it('returns the year of the vehicle') do
			test_vehicle = Vehicle.new("Toyota", "Prius", 2000)
			expect(test_vehicle.year()).to(eq(2000))
		end
	end

	describe("#save") do
		it('saves the vehicle to the array') do
			test_vehicle = Vehicle.new("Toyota", "Prius", 2000)
			test_vehicle.save()
			expect(Vehicle.all()).to(eq([test_vehicle]))
		end
	end

	describe('#id') do
		it('returns the id of the vehicle') do
			test_vehicle = Vehicle.new("Toyota", "Prius", 2000)
			test_vehicle.save()
			expect(test_vehicle.id()).to(eq(1))
		end
	end



end
