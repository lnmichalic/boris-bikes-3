require './lib/docking_station'

station = DockingStation.new
3.times {station.dock(Bike.new)}
bike = Bike.new
bike.report_broken
station.dock(bike)
station.release_bike
station.bikes
