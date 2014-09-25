require_relative 'bloom_filter'

class SpellChecker

  attr_reader :word
  attr_accessor :correct, :hints

  def initialize(word)
    @word = word
    @correct = false
    @hints = {misspell: "", autocomplete: ""}
  end

  def check_spell(probability, bit_map_size)
    bloom_filter = BloomFilter.new(word, probability, bit_map_size)
    run_filter(bloom_filter)
  end

private 
  
  def run_filter(bloom_filter)
    scan_dictionary(bloom_filter)
    update_attributes(bloom_filter)
    @hints
  end

  def scan_dictionary(bloom_filter)
    open_file.each do |line|
      bloom_filter.check_for_suggestions_set(line.chomp)
    end
  end

  def update_attributes(bloom_filter)
    @correct = bloom_filter.suggestion_words_set.flatten.include?(word)
    hints_same_chars(bloom_filter)
    hints_starts_with(bloom_filter)
  end
  # char order = misspell
  def hints_same_chars(bloom_filter)
    words = []
    bloom_filter.suggestion_words_set.each {|key| words << key[1] if misspelled?(key[1]) }
    @hints[:misspell] = words.join(' ')
  end
    #autocomplete
  def hints_starts_with(bloom_filter)
    words = []
    bloom_filter.suggestion_words_set.each {|key| words << key[1] if autocomplete?(key[1]) }
    @hints[:autocomplete] = words.join(' ')
  end

  def misspelled?(key)
    !key.eql?(@word) && search_words_by_chars?(key) 
  end

  def autocomplete?(key)
    !key.eql?(@word) && search_words_by_order(key)
  end
  
  def search_words_by_chars?(word_dictionary)
    word_dictionary.chars.sort.join.start_with?(word.chars.sort.join)
  end

  def search_words_by_order(word_dictionary)
    word_dictionary.start_with?(word)
  end
    
  def file_list
    './wl.txt'
  end

  def open_file
    File.open(file_list, "r")
  end

end