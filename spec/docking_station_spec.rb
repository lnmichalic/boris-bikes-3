require 'docking_station'

describe DockingStation do

	it "responds to release_bike" do
	 is_expected.to respond_to :release_bike
	end
	it "releases a bike" do
		bike = Bike.new
		subject.dock(bike)
		expect(subject.release_bike).to eq bike
	end
	it "Docks a bike" do
		bike = Bike.new
		expect(subject.dock(bike)).to eq [bike]
	end
	it "has a bike" do
		expect(subject).to respond_to :bike
	end
	it "raises error if bike unavailable" do
		expect { subject.release_bike }.to raise_error('No bikes available')
	end
	it "Raises error if dock is at capacity" do
		station = DockingStation.new
		DockingStation::DEFAULT_CAPACITY.times do
			bike = Bike.new
			station.dock(bike)
		end
		expect{station.dock(Bike.new)}.to raise_error("Dock is at capacity")
	end
	it "Lets us dock 20 bikes" do
		DockingStation::DEFAULT_CAPACITY.times {subject.dock(Bike.new)}
		expect(subject.docked_bikes.length).to eq DockingStation::DEFAULT_CAPACITY
	end
	it "shows that there is a default capacity" do
		expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
	end
	it "Shows capacity has been set by system admin" do
		station = DockingStation.new(10)
		expect(station.capacity).not_to eq DockingStation::DEFAULT_CAPACITY
	end
	it "Shows that the capacity can be changed" do
		station = DockingStation.new
		station.capacity = 21
		expect(station.capacity).to eq 21
	end
end
