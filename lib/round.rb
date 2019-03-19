require './lib/turn'

class Round

  attr_reader :deck,
              :turns,
              :current_card,
              :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = deck.cards[0]
    @number_correct = 0
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, @current_card)

    add_turn = @turns.push(new_turn)
    @turns = add_turn

    @current_card = deck.cards[@turns.length]

    if new_turn.correct?
      @number_correct += 1
      new_turn.feedback
    else
      new_turn.feedback
    end

    return new_turn
  end

  def number_correct_by_category(category)
    number_correct = 0;

    @turns.each do |turn|
      if turn.card.category === category
        number_correct += 1
      end
    end
    return number_correct
  end

  def percent_correct
    (@number_correct.to_f / @turns.length * 100).round(2)
  end

  def percent_correct_by_category(category)
    tried_of_category = @turns.count{ |turn| turn.card.category == category }

    (number_correct_by_category(category) / (tried_of_category.nonzero? || 1) * 100).round(2)
  end

end