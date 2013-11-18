def fizzbuzz(n)
	return "FizzBuzz" if n % 3 == 0 && n % 5 == 0
	return "Fizz" if n % 3 == 0
	return "Buzz" if n % 5 == 0
	return n
end
#write to the file
def save_to_file
	# open the file for writing
  file = File.open(@filename, "w") 
  # iterate over the array of students
  @first_hundred.each do |line|
  # puts student
    file.puts line
  end
  file.close
end

@filename = File.dirname(__FILE__) + '/first_hundred.txt'
@first_hundred = (1..100).map { |n| fizzbuzz(n).to_s }
save_to_file

