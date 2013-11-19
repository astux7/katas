def number_to_roman_numeral(numeral)
	return  numeral < 1 || numeral > 3999 ? "" : more_letters(numeral)  
end

def more_letters(numeral)
  numbers = [1000,900,500,400,100,90,50,40,10,9,5,4,1]
  letters = ["M","CM","D","CD","C","XC","L","XL","X","IX","V","IV","I"]
  returned = ""
  i = 0
  loop do 
  break if i == numbers.length
    while(numeral >= numbers[i]) do
      returned += letters[i];
      numeral -= numbers[i];
    end
    i += 1
  end
  return returned
end