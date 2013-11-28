
def number_to_words(number)
	@units = ["zero","one","two","three","four",
		"five","six","seven","eight","nine","ten",
		"eleven","twelve","thirteen","fourteen","fifteen",
		"sixteen","seventeen","eighteen","nineteen"];
	@tens = ["","","twenty","thirty","forty","fifty",
		"sixty","seventy","eighty","ninety"];
  convert(number)
end

def convert(number)
	return @units[number] if number < 20
	return @tens[number/10] +  after_tens(number) if number < 100
  return @units[number/100] + " hundred" + after_hundred(number) if number < 1000 
	return convert(number / 1000) + " thousand" + after_thousand(number) if number < 1000000 
	return convert(number/ 1000000) + " million" + after_million(number)		
end

def after_tens(number)
  number % 10 > 0 ? " " + convert(number % 10) : ""
end

def after_hundred(number)
  number % 100 > 0 ? " and " + convert(number % 100) : ""
end

def after_million(number)
	number % 1000000 > 0 ? " " + convert(number % 1000000) : ""
end

def after_thousand(number)
   number % 1000 > 0 ?  " " + convert(number % 1000) : "" 
end
