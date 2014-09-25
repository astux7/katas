require_relative '../lib/anagram.rb'

describe Anagram do
  let(:anagram) { Anagram.new('asta') }

  it 'Initialized anagram has a word' do
    expect(anagram.word).to eq("asta")
  end

  it 'Should have empty anagram words list ' do 
    expect(anagram.collection).to be_empty
  end

end