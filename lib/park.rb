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
    @vehicles.flat_map { |vehicle| vehicle.passengers }
  end

  def revenue
    vehicles.sum { |vehicle| vehicle.num_adults } * @price
  end
end