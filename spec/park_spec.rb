require './lib/vehicle'
require './lib/passenger'
require './lib/park'

RSpec.describe Park do 
  let(:park) { Park.new('Yellowstone', 35.43)}
  let(:honda) { Vehicle.new('2001', 'Honda', 'Civic') }
  let(:toyota) { Vehicle.new('2015', 'Toyota', 'Rav4') }
  let(:charlie) { Passenger.new({"name" => "Charlie", "age" => 18})}
  let(:jude) { Passenger.new({"name" => "Jude", "age" => 20})}
  let(:taylor) { Passenger.new({"name" => "Taylor", "age" => 12})}
  it 'exists' do 
    expect(park).to be_a Park
  end

  it 'has attributes' do 
    expect(park.name).to eq('Yellowstone')
    expect(park.price).to eq(35.43)
  end

  it 'can list admit vehicles to the park' do 
    expect(park.vehicles).to be_an Array
    expect(park.vehicles).to be_empty
    park.admit(honda)
    park.admit(toyota)

    expect(park.vehicles).to eq(honda, toyota)
  end

  it 'can list passengers that entered the park' do 
    expect(park.passengers).to be_an Array
    expect(park.passengers).to be_empty
    toyota.add_passenger(charlie)
    toyota.add_passenger(jude)
    honda.add_passenger(taylor)
    park.admit(toyota)
    park.admit(honda)

    expect(park.passengers).to eq([charlie, jude, taylor])
  end

  it 'Can list revenue generated' do 
    toyota.add_passenger(charlie)
    toyota.add_passenger(jude)
    honda.add_passenger(taylor)
    park.admit(toyota)
    park.admit(honda)

    expect(park.revenue).to eq(70.86)
  end

end
