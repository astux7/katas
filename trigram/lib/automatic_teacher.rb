class AutomaticTeacher
  attr_accessor :keyword_set, :first, :second, :third

  def initialize
    @keyword_set = {}
    @first = nil
    @second = nil
    @third = nil
  end

  def format_keyword_set(line)
    words = make_to_words(line)
    return if words.nil?
    words.each{|word|
      make_key_word_set(word)
    }
  end

  def make_to_words(line)
    words = line.split(/\W+/)
    return if words.count < 3
    init_words(words) if @first.nil?
  end

  def init_words(line)
    @first, @second, @third = line[0], line[1], line[2]
    @keyword_set[@first+' '+@second] = [@third]
    line.drop(3)
  end

  def make_key_word_set(word)
    @first, @second, @third = @second, @third, word
    if @keyword_set[@first+' '+@second].nil?
      new_keyword
    else
      add_to_keyword 
    end
  end

  def add_to_keyword
    @keyword_set[@first+' '+@second] << @third
  end

  def new_keyword
    @keyword_set[@first+' '+@second] = [@third]
  end

end