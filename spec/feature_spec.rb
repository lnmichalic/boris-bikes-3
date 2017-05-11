require './lib/docking_station'

station = DockingStation.new
3.times {station.dock(Bike.new)}


#p docking_station.dock(bike)

# p docking_station.bike_available?

#p docking_station.release_bike

# p docking_station.full?

# p 20.times {docking_station.dock(bike)}
