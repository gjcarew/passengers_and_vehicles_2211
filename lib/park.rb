class Park
  attr_reader :name, :price, :vehicles

  def initialize(name, price)
    @name = name
    @price = price
    @vehicles = []
  end

  def admit(vehicle)
    @vehicles << vehicle
  end

  def passengers
    @vehicles.flat_map(&:passengers)
  end

  def revenue
    @vehicles.sum(&:num_adults) * @price
  end

  def patrons
    passengers.map(&:name).sort
  end

  def adults
    passengers.select(&:adult?).map(&:name).sort
  end

  def minors
    minors = passengers.select { |passenger| !passenger.adult? }
    minors.map(&:name).sort
  end
end