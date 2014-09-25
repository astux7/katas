require_relative 'anagram'
require_relative 'handler'

class AnagramMaker

  attr_reader :word_list, :handler
  attr_accessor :anagram_list

  def initialize(word_list)
    @word_list = word_list
    @anagram_list = []
    @handler = Handler.new
  end 

  def make_anagram_list
    word_list.each do |word|
      anagram = Anagram.new(word)
      @anagram_list << handler.search_word_anagrams(anagram)
    end
  end

end