require 'digest'
class BloomFilter

  attr_reader :word, :bit_map_size, :probability
  attr_accessor :word_bit_map, :suggestion_words_set

  def initialize(word, probability=75, bit_map_size=10)
    @word = word
    @bit_map_size = bit_map_size
    @probability = probability
    @word_bit_map = create_word_bit_map(word)
    @suggestion_words_set = []
  end
  
  def check_for_suggestions_set(dictionary_word)
    dictionary_bit_map = create_word_bit_map(dictionary_word) 
    add_to_suggestions(dictionary_bit_map, dictionary_word)
  end

  protected

  def add_to_suggestions(bit_map, dictionary_word)
    corellation = calculate_dictionary_word_correlation(bit_map)
    if corellation >= probability
      @suggestion_words_set << [corellation, dictionary_word]
    end    
  end

  def calculate_dictionary_word_correlation(bit_map)
    correlation, addition = 0.0, 100.0/4 # 4- hash number
    0.upto(bit_map_size-1){ |key|
      correlation += addition * bit_map[key] if not_empty_bits?(bit_map,key)
    }
    correlation
  end
  # if same bit has collisions like 1+1 in same place
  def not_empty_bits?(bit_map, key)
    bit_map[key] > 0 && word_bit_map[key] > 0
  end

  def create_hashes(word)
    [hash_1(word), hash_2(word), hash_3(word), hash_4(word)]
  end
  
  def create_word_bit_map(word)  #if word letters mistake like tea ate
    word_bit_map = Array.new(bit_map_size, 0) # word.chars.sort.join  
    create_hashes(word).each{ |key|
      word_bit_map[key] +=1 
    }
    word_bit_map
  end
  # first letter
  def hash_1(word)
    word[0].ord % bit_map_size
  end
  # all letters in word
  def hash_2(word)
    x = 0
    (0..word.length-1).each{|i| x += word[i].ord}
    x % bit_map_size
  end
  # order of letters
  def hash_3(word)
    x = 0
    (0..word.length-1).each{ |i| x += (i+1)*word[i].ord }
    x % bit_map_size
  end
  # middle letter of the word
  def hash_4(word)
    word[word.length/2].ord % bit_map_size
  end

end