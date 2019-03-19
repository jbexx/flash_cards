class Deck

  attr_reader :cards,
              :count

  def initialize(cardDeck)
    @cards = cardDeck
    @count = cards.length
  end

  def cards_in_category(category)

    wantedCards = [];

    cards.each do |card|
      if card.category == category
        wantedCards.push(card)
      else
        # do nothing?
      end
    end
    return wantedCards
  end

end