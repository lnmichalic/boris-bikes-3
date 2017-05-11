require_relative 'bike'

class DockingStation

DEFAULT_CAPACITY = 20

attr_reader :bike, :docked_bikes
attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @docked_bikes = []
    @capacity = capacity
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
      @docked_bikes.length >= @capacity
    end

    def empty?
      @docked_bikes.length == 0
    end

end
