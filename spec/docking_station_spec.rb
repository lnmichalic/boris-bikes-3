require 'docking_station'

describe DockingStation do
  subject(:station) { DockingStation.new }
  let(:bike) { double :bike }

  it "responds to release_bike" do
    is_expected.to respond_to :release_bike
  end

  it "releases a bike" do
    allow(bike).to receive(:working?).and_return(true)
    station.dock(bike)
    expect(station.release_bike).to eq bike
  end

  it "Docks a bike" do
    expect(station.dock(bike)).to eq [bike]
  end

  it "has a bike" do
    expect(station).to respond_to :bike
  end

  it "raises error if bike unavailable" do
    expect { station.release_bike }.to raise_error('No bikes available')
  end

  it "Raises error if dock is at capacity" do
    DockingStation::DEFAULT_CAPACITY.times { station.dock(bike) }
    expect{ station.dock(Bike.new) }.to raise_error("Dock is at capacity")
  end

  it "Lets us dock 20 bikes" do
    DockingStation::DEFAULT_CAPACITY.times { station.dock(Bike.new) }
    expect(station.bikes.length).to eq DockingStation::DEFAULT_CAPACITY
  end

  it "shows that there is a default capacity" do
    expect(station.capacity).to eq DockingStation::DEFAULT_CAPACITY
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

  it "Doesn't release a broken bike" do
    allow(bike).to receive(:report_broken)
    allow(bike).to receive(:working?).and_return(false)
    bike.report_broken
    station.dock(bike)
    expect{ station.release_bike }.to raise_error('No working bikes available')
  end

  it "releases only working bikes" do
    allow(bike).to receive(:report_broken)
    allow(bike).to receive(:working?).and_return(true)

    bike2 = double(:bike)
    allow(bike2).to receive(:report_broken)
    allow(bike2).to receive(:working?).and_return(false)
    station.dock(bike)
    bike2.report_broken
    station.dock(bike2)
    expect(station.release_bike).to eq bike
  end

end
