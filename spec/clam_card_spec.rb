require_relative "../lib/clam_card.rb"

describe ClamCard do
  let(:bank_account) { spy('bank_account') }
  subject(:card) { ClamCard.new(bank_account) }

  it 'charges the linked bank account with the cost of the journey' do
    card.charge(2)

    expect(bank_account).to have_received(:charge).with(2)
  end
end
