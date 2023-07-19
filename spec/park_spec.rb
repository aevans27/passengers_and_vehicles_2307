require './lib/vehicle'
require './lib/passenger'
require './lib/park'

RSpec.describe Park do
  it 'initialize' do
    state_park = Park.new("State", 30)
    expect(state_park).to be_an(Park)
  end

  it 'get info' do
    state_park = Park.new("State", 30)
    expect(state_park).to be_an(Park)

    expect(state_park.name).to eq("State")
    expect(state_park.admission_price).to eq(30)
  end

  it 'get vehicles' do
    state_park = Park.new("State", 30)
    expect(state_park).to be_an(Park)

    expect(state_park.name).to eq("State")
    expect(state_park.admission_price).to eq(30)

    honda = Vehicle.new("2001", "Honda", "Civic")    
    mini = Vehicle.new("2011", "Mini", "Cooper")    
    ford = Vehicle.new("2013", "Ford", "Escape") 
    
    expect(state_park.vehicles).to eq([])
    state_park.add_vehicle(honda)
    state_park.add_vehicle(mini)
    state_park.add_vehicle(ford)
    expect(state_park.vehicles).to eq([honda, mini, ford])
    expect(state_park.vehicles.first.year).to eq("2001")
  end

  it 'get passengers in vehicles' do
    state_park = Park.new("State", 30)
    expect(state_park).to be_an(Park)

    expect(state_park.name).to eq("State")
    expect(state_park.admission_price).to eq(30)

    honda = Vehicle.new("2001", "Honda", "Civic")    
    mini = Vehicle.new("2011", "Mini", "Cooper")    

    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    jude = Passenger.new({"name" => "Jude", "age" => 20})    
    taylor = Passenger.new({"name" => "Taylor", "age" => 12}) 

    honda.add_passenger(charlie)
    mini.add_passenger(jude)
    mini.add_passenger(taylor)
    
    expect(state_park.vehicles).to eq([])
    state_park.add_vehicle(honda)
    state_park.add_vehicle(mini)
    expect(state_park.vehicles).to eq([honda, mini])

    state_park.get_vehicle_passengers
    expect(state_park.passengers).to eq([charlie, jude, taylor])

    state_park.charge_adults
    expect(state_park.revenue).to eq(60)
  end

  it 'get list of adults and kids' do
    state_park = Park.new("State", 30)
    expect(state_park).to be_an(Park)

    expect(state_park.name).to eq("State")
    expect(state_park.admission_price).to eq(30)

    honda = Vehicle.new("2001", "Honda", "Civic")    
    mini = Vehicle.new("2011", "Mini", "Cooper")    

    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    jude = Passenger.new({"name" => "Jude", "age" => 20})    
    taylor = Passenger.new({"name" => "Taylor", "age" => 12}) 
    bob = Passenger.new({"name" => "Bob", "age" => 11}) 

    honda.add_passenger(charlie)
    honda.add_passenger(bob)
    mini.add_passenger(jude)
    mini.add_passenger(taylor)
    
    expect(state_park.vehicles).to eq([])
    state_park.add_vehicle(honda)
    state_park.add_vehicle(mini)
    expect(state_park.vehicles).to eq([honda, mini])
    
    state_park.get_vehicle_passengers
    expect(state_park.passengers).to eq([charlie, bob, jude, taylor])

    expect(state_park.all_attendees).to eq(["Bob", "Charlie", "Jude", "Taylor"])
    expect(state_park.minors).to eq(["Bob", "Taylor"])
    expect(state_park.adults).to eq(["Charlie", "Jude"])
  end
end