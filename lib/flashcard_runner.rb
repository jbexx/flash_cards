require './lib/card'
require './lib/deck'
require './lib/round'

# Create some cards
# Put cards in deck
# Create a new round with the deck
# Start round with new method called 'start'

cards = [
  Card.new("What is the capital of Colorado?", "Denver", :Geography),
  Card.new("What is 5 + 7?", "12", :Math),
  Card.new("What is the capital of China", "Beijing", :Geography),
  Card.new("What is the square root of 4?", "2", :Math)
]

categories = cards.reduce([]) { |acc, card| 
    if acc.include?(card.category)
      # do nothing
    else
      acc << card.category
    end
  acc
  }

deck = Deck.new(cards)
round = Round.new(deck)


puts "Welcome! You're playing with #{cards.count} cards."
puts "-----------------------------------------------------------"

until round.turns.count == cards.count
  puts "This is card number #{round.turns.count + 1} out of #{cards.count}"
  puts "Question: #{round.current_card.question}"
  guess = gets
  turn = round.take_turn(guess.chomp)
  puts turn.feedback
end

puts "****** Game Over! ******"
puts "You had #{round.number_correct} correct guesses out of #{cards.count} for a total score of #{round.percent_correct} %"
categories.each do |category|
  puts "#{category} - #{round.percent_correct_by_category(category)} % correct"
end
