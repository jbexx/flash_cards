class Deck

  attr_reader :cards,
              :count

  def initialize(cardDeck)
    @cards = cardDeck
    @count = cards.length
  end

  def cards_in_category(category)
    @cards.select do |card|
      card.category == category
    end
  end

end