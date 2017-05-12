require_relative 'bike'

class DockingStation

DEFAULT_CAPACITY = 20

attr_reader :bike, :bikes
attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if empty?
    fail 'No working bikes available' if working_bikes.empty?
    bike_to_be_popped = working_bikes.pop
    @bikes.delete bike_to_be_popped
  end

  def dock(bike)
    fail "Dock is at capacity" if full?
    @bikes << bike
  end

  private
    def working_bikes
      @bikes.select{|bike| bike.working?}
    end

    def full?
      @bikes.length >= @capacity
    end

    def empty?
      @bikes.length == 0
    end

end
