def sort(word)
	word.chars.sort.join
end

def same_word?(word, comparator)
	word == comparator
end

def ordered?(word)
	same_word?(sort(word), word)
end