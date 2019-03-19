class Deck

  attr_reader :cards,
              :count

  def initialize(cardDeck)
    @cards = cardDeck
    @count = cards.length
  end

  def cards_in_category(category)

    wanted_cards = [];

    cards.each do |card|
      if card.category == category
        wanted_cards.push(card)
      else
        # do nothing?
      end
    end
    return wanted_cards
  end

end