require 'bike'

describe Bike do
  it "responds to working?" do
    is_expected.to respond_to :working?
  end
  it "allows user to report a broken bike" do
    is_expected.to respond_to :report_broken
  end
  it "Test if report_broken changes status working? to false" do
    bike = Bike.new
    bike.report_broken
    expect(bike.working?).to eq false
  end
end
