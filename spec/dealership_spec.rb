require('rspec')
require('dealership')

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











end
