require_relative 'bike'

class DockingStation

attr_reader :bike, :docked_bikes

  def initialize
    @docked_bikes = []
  end

  def release_bike
    fail 'No bikes available' if empty?
    @docked_bikes.pop
  end

#allows user to dock bike
  def dock(bike)
    fail "Dock is at capacity" if full?
    @docked_bikes << bike
  end

  private
    def full?
      @docked_bikes.length >= 20
    end

    def empty?
      @docked_bikes.length == 0
    end

end
