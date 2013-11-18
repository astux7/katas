def roman_numeral_to_number(numeral)
	@one_letter = {'I' => 1,'V'=> 5, 'X'=> 10, 'L' => 50,
				 'C' => 100, 'D'=> 500, 'M' => 1000}
    
	return @one_letter[numeral] if numeral.length == 1
	return sub_or_add(numeral)
end

def sub_or_add(numeral)
	charss = convert_by_char(numeral.chars) 
	totals = 0
	n = 0
    while(charss[n]!=nil)
		if on_the_left_less?(charss,n)
			part = charss[n]
	    elsif on_the_right_greater?(charss,n)
			part = -1 * charss[n]
		else
			part = charss[n]	
		end
		totals += part
		n += 1
	end
	totals
end

def on_the_left_less?(chars,n)
	return chars[n+1] != nil && chars[n] >= chars[n+1]
	
end

def on_the_right_greater?(chars,n)
	return chars[n+1] != nil && chars[n] < chars[n+1]
end

def convert_by_char(inputhash)
	return_val = {}
	inputhash.each_with_index do |key,val|
		return_val[val] = @one_letter[key]
	end
	return_val
end
