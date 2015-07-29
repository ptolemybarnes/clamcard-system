class Journey
  def initialize(from:, to:, card:)
    @from = from
    @to   = to
    @card = card
    @zone_2_list = [ :barbican  ]
  end

  def travel
    charge = travelling_in_zone_2? ? 3 : 2.5
    card.enter_zone_2 if travelling_in_zone_2?
    card.charge(charge)
  end

  def travelling_in_zone_2?
    zone_2_list.include?(from) || zone_2_list.include?(to)
  end

  private

  attr_reader :card, :from, :to, :zone_2_list
end
