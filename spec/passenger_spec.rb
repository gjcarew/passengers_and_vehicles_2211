require './lib/passenger'

RSpec.describe Passenger do
  before :each do 
    @passenger = Passenger.new({"name" => "Charlie", "age" => 18})
  end
  it 'exists' do 
    expect(@passenger).to be_a Passenger
  end

  xit 'has attributes' do 
    expect(@passenger.name).to eq('Charlie')
    expect(@passenger.age).to eq(18)
  end

  xit 'has a method to tell if a passenger is an adult' do 
    expect(@passenger.adult?).to eq(true)
    passenger2 = Passenger.new({"name" => "Taylor", "age" => 12})
    expect(passenger2.adult?).to eq(false)
  end

  xit 'A passenger is not instantiated as a driver' do
    expect(@passenger.driver?).to eq(false)
  end

  xit 'A passenger can be made a driver' do 
    @passenger.drive
    expect(@passenger.driver?).to eq(false)
  end
end