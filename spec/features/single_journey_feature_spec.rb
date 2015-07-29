describe 'a single journey' do

  context 'when travelling within zone 1' do

    it 'charges £2.50' do 
      clamcard = ClamCard.new(bank_account = BankAccount.new)

      journey = Journey.new(from: :asterisk, to: :aldgate, card: clamcard)
      journey.travel

      expect(bank_account.total_charges).to eq 2.5
    end

  end

  context 'when travelling across zones' do

    it 'charges £3 for one journey' do 
      clamcard = ClamCard.new(bank_account = BankAccount.new)

      journey = Journey.new(from: :asterisk, to: :barbican, card: clamcard)
      journey.travel

      expect(bank_account.total_charges).to eq 3
    end

    it 'charges £3 for the second journey' do 
      clamcard = ClamCard.new(bank_account = BankAccount.new)

      journey = Journey.new(from: :asterisk, to: :barbican, card: clamcard)
      journey.travel
      journey = Journey.new(from: :barbican, to: :balham, card: clamcard)
      journey.travel

      expect(bank_account.total_charges).to eq(2*3)
    end

    it 'charges £2 for the third journey' do 
      clamcard = ClamCard.new(bank_account = BankAccount.new)

      journey = Journey.new(from: :asterisk, to: :barbican, card: clamcard)
      journey.travel
      journey = Journey.new(from: :barbican, to: :balham, card: clamcard)
      journey.travel
      journey = Journey.new(from: :balham, to: :bison, card: clamcard)
      journey.travel

      expect(bank_account.total_charges).to eq(2*3 + 2)
    end

    it 'charges nothing for subsequent journeys' do 
      clamcard = ClamCard.new(bank_account = BankAccount.new)

      journey = Journey.new(from: :asterisk, to: :barbican, card: clamcard)
      journey.travel
      journey = Journey.new(from: :barbican, to: :balham, card: clamcard)
      journey.travel
      journey = Journey.new(from: :balham, to: :bison, card: clamcard)
      journey.travel
      journey = Journey.new(from: :bison, to: :asterisk, card: clamcard)
      journey.travel

      expect(bank_account.total_charges).to eq(2*3 + 2)
    end
  end
end
