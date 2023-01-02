require './lib/vehicle'
require './lib/passenger'

RSpec.describe Vehicle do 
  let(:vehicle) { Vehicle.new('2001', 'Honda', 'Civic') }

  it 'exists' do 
    expect(vehicle).to be_a Vehicle
  end

  it 'has attributes' do 
    expect(vehicle.year).to eq('2001')
    expect(vehicle.make).to eq('Honda')
    expect(vehicle.model).to eq('Civic')
  end

  describe 'speeding' do 
    let(:vehicle) { Vehicle.new('2001', 'Honda', 'Civic') }

    it 'By default is not speeding' do 
      expect(vehicle.speeding?).to be false
    end

    it 'can be made to start speeding' do 
      vehicle.speed
      expect(vehicle.speeding?).to be true
    end
  end

  describe 'passengers' do
    it 'starts out without passengers' do 
      expect(vehicle.passengers).to be_empty
    end

    let(:charlie) { Passenger.new({"name" => "Charlie", "age" => 18})}
    let(:jude) { Passenger.new({"name" => "Jude", "age" => 20})}
    let(:taylor) { Passenger.new({"name" => "Taylor", "age" => 12})}

    it 'can add passengers' do 
      vehicle.add_passenger(charlie) 
      vehicle.add_passenger(jude)
      vehicle.add_passenger(taylor)
      expect(vehicle.passengers).to be_an Array
      expect(vehicle.passengers.length).to eq(3)
      expect(vehicle.passengers).to all(be_a Passenger) 
    end

    it 'can count adults' do
      vehicle.add_passenger(charlie) 
      vehicle.add_passenger(jude)
      vehicle.add_passenger(taylor) 
      expect(vehicle.num_adults).to eq(2)
    end
  end
end
