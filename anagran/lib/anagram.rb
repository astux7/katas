class Anagram

  attr_reader :word
  attr_accessor :collection

  def initialize(word)
    @word = word
    @collection = []
  end

end