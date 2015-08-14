require('rspec')
require('dealership')

describe('Dealership') do
  # before() do
  #   Dealership.clear()
  # end

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









end
