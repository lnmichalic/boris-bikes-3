require_relative 'bike'

class DockingStation

attr_reader :bike, :docked_bikes

  def initialize
    @docked_bikes = []
  end

  def release_bike
    fail 'No bikes available' unless @docked_bikes.length > 0
    @docked_bikes.first
  end

#allows user to dock bike
  def dock(bike)
    fail "Dock is at capacity" if at_capacity?
    @docked_bikes << bike
  end

  # def bike_available?
  #   true
  # end

  def at_capacity?
    @docked_bikes.length >= 20
  end

end
