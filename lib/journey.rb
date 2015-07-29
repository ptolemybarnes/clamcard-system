class Journey
  def initialize(from:, to:, card:)
    @card = card
  end

  def travel
    card.charge(2.5)
  end

  private

  attr_reader :card
end
