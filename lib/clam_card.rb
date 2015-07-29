class ClamCard
  def initialize(bank_account)
    @bank_account = bank_account
  end

  def charge(value)
    bank_account.charge(value)
  end

  private

  attr_reader :bank_account
end
