class Turn

  attr_reader :guess,
              :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    if @guess.downcase == @card.answer.downcase
      return true
    else
      return false
    end
  end

  def feedback
    correct?() ? "Correct!" : "Incorrect"
  end

end