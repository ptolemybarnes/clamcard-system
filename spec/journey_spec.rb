require_relative '../lib/journey.rb'

describe Journey do

  let(:clamcard) { spy(:clamcard) } 

  it 'charges the clamcard for cost of the journey within zone 1' do
    Journey.travel(from: :asterisk, to: :aldgate, card: clamcard)

    expect(clamcard).to have_received(:charge).with(2.5)
  end

  it 'charges the clamcard for the cost of the journey between zones 1 and 2' do
    Journey.travel(from: :aldgate, to: :barbican, card: clamcard)

    expect(clamcard).to have_received(:charge).with(3)
  end

  it 'informs the clamcard when journey travels through zone 2' do
    Journey.travel(from: :aldgate, to: :barbican, card: clamcard)

    expect(clamcard).to have_received(:enter_zone_2)
  end

  it 'provides some syntactical sugar' do
    journey = Journey.travel(from: :asterisk, to: :aldgate, card: clamcard)
    # can't write test for this
  end

end
