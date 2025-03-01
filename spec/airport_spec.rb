require_relative '../lib/airport'

describe Airport do

  include_context "airport mock config"

  before(:each) do
    allow(plane).to receive(:land).and_return(plane)
    allow(plane).to receive(:take_off).and_return(plane)
  end

  describe 'airport capacity' do

    before(:each) do
      allow(plane).to receive(:flying?).and_return(true)
    end

    it 'should support default capacity of airport' do
      described_class::DEFAULT_CAPACITY.times do
        airport.land(plane)
      end 
      expect { airport.land(plane) }.to raise_error 'Cannot land, airport at full capacity.'
    end

    it 'should support non default capacity' do
      non_default_capacity_airport = described_class.new(weather, 10)
      10.times do
        non_default_capacity_airport.land(plane)
      end  
      expect { non_default_capacity_airport.land(plane) }.to raise_error 'Cannot land, airport at full capacity.'
    end

  end

  describe "#take_off" do
 
    it "should raise an error when plane not at the airport" do
      airport.land(plane)
      airport.take_off(plane)
      expect { airport.take_off(plane) }.to raise_error 'This plane is not at this airport.'
    end

    it "confirms that a plane in an airport can not take off from a different airport" do

      other_airport = described_class.new(weather)
      other_airport.land(plane)

      expect { airport.take_off(plane) }.to raise_error 'This plane is not at this airport.'
    end
  end 

  describe "#land" do

    it "confirms that the plane has landed at the airport" do
      expect { airport.land(plane) }.not_to raise_error       
    end

  end

  describe "#plane_inventory" do
    it "should show a plane at the airport" do
      airport.land(plane)
      expect(airport.plane_inventory).to include(plane)
    end

    it "should show no planes in the airport" do
      expect(airport.plane_inventory).to be_empty
    end
  end

  context "stormy weather" do

    describe "#take_off" do
      it "should prevent takeoff if the weather is stormy" do
        airport = described_class.new(stormy_weather)
        expect { airport.take_off(plane) }.to raise_error 'Cannot take off, weather is stormy.'
      end
    end

    describe "#land" do
      it "should prevent landing if the weather is stormy" do
        airport = described_class.new(stormy_weather)
        expect { airport.land(plane) }.to raise_error 'Cannot land, weather is stormy.'
      end
    end
  end

  context "Mulitple planes at the airport" do

    before(:each) do
      allow(plane_one).to receive(:land).and_return(plane_one)
      allow(plane_two).to receive(:land).and_return(plane_two)
      allow(plane_three).to receive(:land).and_return(plane_three)
      allow(plane_two).to receive(:take_off).and_return(plane_two)
    end
    
    it "should allow a specific plane to take off from the airport" do
      land_three_planes(plane_one, plane_two, plane_three)
      expect(airport.take_off(plane_two)).to be(plane_two) 
    end

    it "confirm that a plane is no longer at the airport after taking off" do
      land_three_planes(plane_one, plane_two, plane_three)
      airport.take_off(plane_two)

      expect(airport.plane_inventory).not_to include(plane_two)
    end

    it "should give the inventory of the airport " do
      land_three_planes(plane_one, plane_two, plane_three)
      expect(airport.plane_inventory).to include(plane_one, plane_two, plane_three)
    end

  end
end
