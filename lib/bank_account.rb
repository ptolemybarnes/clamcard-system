class BankAccount

  def initialize
    @charge_ledger = []
  end

  def total_charges
    charge_ledger.inject(0, :+)
  end
  
  def charge value
    charge_ledger << value
  end

  private

  attr_reader :charge_ledger
end
