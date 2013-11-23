def devisible_by_3?(number)
  number % 3 == 0
end
def divisible_by_5?(number)
  number % 5 == 0
end
def devisible_by_15?(number)
  devisible_by_3?(number) && divisible_by_5?(number)
end

def fizzbuzz(number)
	return "FizzBuzz" if devisible_by_15?(number)
	return "Fizz" if devisible_by_3?(number)
	return "Buzz" if divisible_by_5?(number)
	return number
end
