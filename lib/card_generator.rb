require './lib/card'

class CardGenerator

  def initialize(filename)
    @filename = filename
  end

  def filename
    @filename
  end
  def read_file
    card_text_array = IO.readlines(@filename)

    card_text_array.map do |string|
      card_content = string.chomp.split(",")
      Card.new(card_content[0], card_content[1], card_content[2])
    end
  end

end