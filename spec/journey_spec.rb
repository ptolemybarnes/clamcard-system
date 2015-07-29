require_relative '../lib/journey.rb'

describe Journey do

  let(:clamcard) { spy(:clamcard) } 

  it 'charges the clamcard for cost of the journey' do
    journey = Journey.new(from: "asterisk", to: "aldgate", card: clamcard)

    journey.travel
    
    expect(clamcard).to have_received(:charge).with(2.5)
  end

end
