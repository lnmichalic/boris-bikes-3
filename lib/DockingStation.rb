require_relative 'Bike'

class DockingStation

attr_reader :bike

  def release_bike
    fail 'No bikes available' unless @bike
    @bike
  end

#allows user to dock bike
  def dock(bike)
    fail "Dock is at capacity" unless at_capacity? != true
    @bike = bike
  end

  def bike_available?
    true
  end

  def at_capacity?
    true if @bike
  end

end
