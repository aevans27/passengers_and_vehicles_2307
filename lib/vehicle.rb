class Vehicle
  attr_reader :year,
              :make,
              :model,
              :passengers
  def initialize(year, make, model)
    @year = year
    @make = make
    @model = model
    @is_speeding = false
    @passengers = []
  end

  def speeding?
    @is_speeding
  end

  def speed
    @is_speeding = true
  end

  def add_passenger(passenger)
    @passengers << passenger
  end

  def number_adults
    adults = 0
    @passengers.each do |pass|
      if pass.adult?
        adults += 1
      end
    end
    adults
  end
end