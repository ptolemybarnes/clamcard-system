require_relative '../lib/journey.rb'

describe Journey do

  let(:clamcard) { spy(:clamcard) } 

  it 'charges the clamcard for cost of the journey within zone 1' do
    journey = Journey.new(from: :asterisk, to: :aldgate, card: clamcard)

    journey.travel
    
    expect(clamcard).to have_received(:charge).with(2.5)
  end

  it 'charges the clamcard for the cost of the journey between zones 1 and 2' do
    journey = Journey.new(from: :aldgate, to: :barbican, card: clamcard)

    journey.travel

    expect(clamcard).to have_received(:charge).with(3)
  end

  it 'informs the clamcard when journey travels through zone 2' do
    journey = Journey.new(from: :aldgate, to: :barbican, card: clamcard)

    journey.travel

    expect(clamcard).to have_received(:enter_zone_2)
  end

end
