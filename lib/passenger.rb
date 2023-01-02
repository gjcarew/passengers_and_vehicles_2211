class Passenger
  attr_reader :name, :age

  def initialize(input_hash)
    @name = input_hash['name']
    @age = input_hash['age']
    @driver = false
  end

  def adult?
    age >= 18
  end

  def driver?
    @driver
  end

  def drive
    @driver = true
  end
end