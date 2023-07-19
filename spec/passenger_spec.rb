require './lib/passenger'

RSpec.describe Passenger do
  it 'init' do
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})    
    taylor = Passenger.new({"name" => "Taylor", "age" => 12}) 

    expect(charlie).to be_an(Passenger)
  end

  it 'get passenger info' do
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})    
    taylor = Passenger.new({"name" => "Taylor", "age" => 12}) 
    expect(charlie).to be_an(Passenger)
  
    expect(charlie.name).to eq("Charlie")
    expect(charlie.age).to eq(18)
    expect(charlie.adult?).to eq(true)
    expect(taylor.adult?).to eq(false)
    expect(charlie.driver?).to eq(false)
    charlie.drive
    expect(charlie.driver?).to eq(true)
  
  end
end


