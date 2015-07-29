require_relative "../lib/clam_card.rb"

describe ClamCard do
  let(:bank_account) { spy('bank_account') }
  subject(:card) { ClamCard.new(bank_account) }

  it 'charges the linked bank account with the cost of the journey' do
    card.charge(2)

    expect(bank_account).to have_received(:charge).with(2)
  end

  it 'charges the linked bank account a maximum of 7GBP for journeys in zone 1' do
    4.times do
      card.charge(2.5)
    end

    expect(bank_account).to have_received(:charge).with(2.5).exactly(2).times
    expect(bank_account).to have_received(:charge).with(2).exactly(1).times
    expect(bank_account).to have_received(:charge).with(2).exactly(1).times
  end

  it 'charges the linked bank account a maximum of 8GBP for journeys going through zone 2' do
    card.charge(2.5)
    card.enter_zone_2
    
    2.times do
      card.charge(3)
    end

    expect(bank_account).to have_received(:charge).with(2.5).exactly(2).times
    expect(bank_account).to have_received(:charge).with(3)
  end

end
