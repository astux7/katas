def devisible_by_3?(number)
  number % 3 == 0
end
def devisible_by_5?(number)
  number % 5 == 0
end

def fizzbuzz(n)
	return "FizzBuzz" if devisible_by_3? && is_divisible_by_five?
	return "Fizz" if devisible_by_3?
	return "Buzz" if is_divisible_by_5?
	return n
end


=begin
###################
class FizzBuzz
  def self.is_divisible_by_three?(number)
      divisible_by?(3,number)
  end
  def self.is_divisible_by_five?(number)
      divisible_by?(5,number)
  end
    def self.is_divisible_by_fifteen?(number)
      divisible_by?(15,number)
  end
  def self.divisible_by?(divisor, number)
    number % divisor == 0
  end
  def  self.fizzit(number)
     return "FizzBuzz" if is_divisible_by_fifteen(number)
     return "fizz" if is_divisible_by_three(number)
     return "Buzz" if is_divisible_by_five(number)
     number
  end
end

irb > 1.upto(100) { |num| puts FizzBuzz.fizzit(num) }

self.* class method

gem - library incl in projects

=end