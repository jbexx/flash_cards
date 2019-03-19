require './lib/card'
require './lib/card_generator'
require './lib/deck'
require './lib/round'

card_generator = CardGenerator.new("./cards.txt")
cards = card_generator.read_file

categories = cards.reduce([]) { |acc, card| 
    if !acc.include?(card.category)
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
