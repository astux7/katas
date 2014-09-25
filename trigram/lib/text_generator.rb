class TextGenerator
  
  attr_accessor :text, :key_words_set
  attr_reader :word_count

  def initialize(word_count = 1, key_words_set = {})
    @text = []
    @key_words_set = key_words_set
    @word_count = word_count
  end
  
  def generate_text
    random_start_keys
    0.upto(word_count) { 
      break unless word_extendable?
    }
  end

  def word_extendable?
    word = generate_neighbor(@text.last(2).join(' '))
    return false if word.nil?
    @text << word 
    true
  end

  def show_the_story
    @text.join(' ').chomp
  end

  def generate_neighbor(key)
    key_words_set[key].sample unless key_words_set[key].nil? 
  end

  def random_start_keys
    @text << @key_words_set.keys.sample.split(' ')
    @text = @text.flatten(2)
  end

end