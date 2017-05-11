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
		20.times do
			bike = Bike.new
			station.dock(bike)
		end
		expect{station.dock(Bike.new)}.to raise_error("Dock is at capacity")
	end
	it "Lets us dock 20 bikes" do
		20.times {subject.dock(Bike.new)}
		expect(subject.docked_bikes.length).to eq 20
	end
	it "shows that there is a default capacity" do
		expect(subject.capacity).to eq 20
	end
end
