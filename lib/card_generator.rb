require './lib/card'

class CardGenerator

  attr_reader :filename,
              :cards

  def initialize(filename)
    @filename = filename
    @cards = []

    read_file
  end

  def read_file
    card_text_array = IO.readlines(@filename)

    @cards = card_text_array.map do |string|
      card_content = string.chomp.split(",")
      Card.new(card_content[0], card_content[1], card_content[2])
    end
  end

end