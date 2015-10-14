class ClamCard
  ZONE_1_CAP = 7
  ZONE_2_CAP = 8

  def initialize(bank_account)
    @bank_account = bank_account
    @charges_ledger = []
    @in_zone_2     = false
  end

  def charge(value)
    bank_account.charge(calculated_value(value))
    @charges_ledger << value
    self
  end

  def enter_zone_2
    @in_zone_2 = true
  end

  private

  def calculated_value(value)
    total_charged >= cap ? 0 : difference_to_cap(value)
  end

  def difference_to_cap(value)
    [cap - total_charged, value].min
  end

  def total_charged
    @charges_ledger.inject(0, :+)
  end

  def cap
    @in_zone_2 ? ZONE_2_CAP : ZONE_1_CAP
  end

  attr_reader :bank_account, :charges_ledger
end
