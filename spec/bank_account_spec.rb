require_relative '../lib/bank_account.rb'

describe BankAccount do

  it 'starts with zero charges' do
    expect(subject.total_charges).to eq 0
  end

  it 'total reflects one charge made' do
    subject.charge(2)

    expect(subject.total_charges).to eq 2
  end

  it 'total sums up multiple charges made' do
    subject.charge(2)
    subject.charge(3)

    expect(subject.total_charges).to eq 5
  end
end
