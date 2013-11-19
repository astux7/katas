def longer_words?(word)
	0.upto(word.length-1) do |n|
		if n < word.length-1
			return  comparison_letters?(word,n) ? true : false
		end 
	end
	return true
end

def comparison_letters?(word,pos)
	return word[pos].downcase.bytes[0] > word[pos+1].downcase.bytes[0] ? false : true
end

def ordered?(word)
	return true if word.length == 1
	return longer_words?(word)
end