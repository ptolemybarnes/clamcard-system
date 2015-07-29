describe 'a single journey' do

  context 'when travelling within zone 1' do

    it 'charges £2.50' do 
      clamcard = ClamCard.new(bank_account = BankAccount.new)

      journey = Journey.new(from: :asterisk, to: :aldgate, card: clamcard)
      journey.travel

      expect(bank_account.total_charges).to eq 2.5
    end

  end

end
