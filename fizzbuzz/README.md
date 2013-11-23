### Challenge

The aim of this kata is to implement a FizzBuzz method. The method replaces any number divisible by 3 with 'Fizz', and number divisible by 5 with 'Buzz', and any number divisible by both 3 and 5 with 'FizzBuzz'. Other numbers remain untouched.

**Difficulty**: Easy

to run the fizzbuzz type in dir:
ruby fizzbuzz.rb

to run the test of it:
rspec fizzbuzz_spec.rb


OTHER EXAMPLE with the CLASS

=begin
################### Class ####################
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