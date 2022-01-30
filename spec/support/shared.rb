
module SharedConfig
  RSpec.shared_context "shared config", :shared_context => :metadata do

    let(:plane) { double(:plane) }
    let(:weather) { double(:weather, :stormy? => false) }
  
    subject(:airport) { described_class.new(weather) }
  
    let(:plane_one) { double(:plane) }
    let(:plane_two) { double(:plane) }
    let(:plane_three) { double(:plane) }

    def land_three_planes(plane_one, plane_two, plane_three)
      airport.land(plane_one)
      airport.land(plane_two)
      airport.land(plane_three)
    end
    
  end
end
