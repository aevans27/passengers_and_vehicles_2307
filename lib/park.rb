class Park
  attr_reader :name,
              :admission_price,
              :vehicles,
              :passengers,
              :revenue
  def initialize(name, admission_price)
    @name = name
    @admission_price = admission_price
    @vehicles = []
    @passengers = []
    @revenue = 0
  end

  def add_vehicle(vehicle)
    @vehicles << vehicle
  end

  def get_vehicle_passengers
    if @vehicles.count > 0
      @vehicles.each do |vehicle|
        vehicle.passengers.each do |pass|
          @passengers << pass
        end
      end
      @passengers
    end
  end

  def charge_adults
    if @passengers.count > 0
      @passengers.each do |person|
        if person.adult?
          @revenue += 30
        end
      end
      @revenue
    else
      @revenue
    end
  end

  def all_attendees
    names = []
    @passengers.each do |person|
      names << person.name
    end
    names.sort
  end

  def minors
    names = []
    @passengers.each do |person|
      if person.adult? == false
        names << person.name
      end
    end
    names.sort
  end

  def adults
    names = []
    @passengers.each do |person|
      if person.adult?
        names << person.name
      end
    end
    names.sort
  end
end