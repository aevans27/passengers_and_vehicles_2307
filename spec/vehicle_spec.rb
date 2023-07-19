require './lib/vehicle'
require './lib/passenger'

RSpec.describe Vehicle do
  it "initialize" do
    vehicle = Vehicle.new("2001", "Honda", "Civic")    
    expect(vehicle).to be_an(Vehicle)
  end

  it "get vehicle info" do
    vehicle = Vehicle.new("2001", "Honda", "Civic")    
    expect(vehicle).to be_an(Vehicle)

    expect(vehicle.year).to eq("2001")
    expect(vehicle.make).to eq("Honda")
    expect(vehicle.model).to eq("Civic")
  end

  it "was speeding" do
    vehicle = Vehicle.new("2001", "Honda", "Civic")    
    expect(vehicle).to be_an(Vehicle)

    expect(vehicle.speeding?).to eq(false)
    vehicle.speed
    expect(vehicle.speeding?).to eq(true)
  end

  it "has passengers" do
    vehicle = Vehicle.new("2001", "Honda", "Civic")    
    expect(vehicle).to be_an(Vehicle)

    expect(vehicle.passengers).to eq([])
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    jude = Passenger.new({"name" => "Jude", "age" => 20})    
    taylor = Passenger.new({"name" => "Taylor", "age" => 12}) 

    vehicle.add_passenger(charlie)
    vehicle.add_passenger(jude)
    vehicle.add_passenger(taylor)

    expect(vehicle.passengers).to eq([charlie, jude, taylor])
    expect(vehicle.number_adults).to eq(2)
  end
end