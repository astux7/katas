require './lib/spell_checker'

word = 'tea'
sp = SpellChecker.new(word)
sp.check_spell(75, 25)
puts "'#{word}' is correct" if sp.correct
puts "'#{word}' was not found in dictionary " unless sp.correct
puts "Hints and suggestions below"
puts sp.hints.inspect