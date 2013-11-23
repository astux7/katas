def devisible_by_3?(number)
  number % 3 == 0
end
def devisible_by_5?(number)
  number % 5 == 0
end
def devisible_by_15?(number)
  devisible_by_3? && divisible_by_5?
end

def fizzbuzz(n)
	return "FizzBuzz" if devisible_by_15?
	return "Fizz" if devisible_by_3?
	return "Buzz" if divisible_by_5?
	return n
end
