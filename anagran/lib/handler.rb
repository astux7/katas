class Handler

  def search_word_anagrams(anagram)
    open_file.each do |line|
      anagram.collection << line.chomp if is_similar?(anagram.word,line)
    end
    anagram.collection.join(' ').chomp
  end

  def word_to_alphabetic_order(word)
      word.downcase.chars.sort.join
  end

  protected

    def anagram(anagram_word)
      word_to_alphabetic_order(anagram_word)
    end

    def current_word(word)
      word_to_alphabetic_order(word)
    end

    def is_similar?(anagram_word, word)
      anagram(anagram_word).eql?(current_word(word.chomp))
    end
    
  private 
    
    def file_list
      './wl.txt'
    end

    def open_file
      File.open(file_list, "r")
    end

end