require_relative '../lib/spell_checker.rb'

describe SpellChecker do
  let(:checker1) { SpellChecker.new('tea') }
  let(:checker2) { SpellChecker.new('tae') }

  it 'Initialized spell checker with word' do
    expect(checker1.word).to eq('tea')
  end

  it 'Should say word tea is correct' do
    checker1.check_spell(75,50)
    expect(checker1.correct).to be_true
  end

  it 'Should say word tae is incorrect' do
    checker2.check_spell(75,50)
    expect(checker2.correct).to be_false
  end

  it 'Should return false in word was not in dictionary' do
    words_collection = checker2.check_spell(50,50)
    expect(checker2.hints).not_to  include('tae') 
  end

  it 'Should return true in word was not in dictionary' do
    words_collection = checker2.check_spell(50,50)
    expect(checker2.hints[:misspell].split(' ')).to include('tea') 
  end

end