require_relative '../lib/handler.rb'

describe Handler do
  let(:handler) { Handler.new }
  let(:anagram) { double('anagram', :word => 'asta', :collection => []) }

  it "Search word's anagrams in files" do
    handler.search_word_anagrams(anagram)
  end

  it 'Should order word by alphabetic ' do
    expect(handler.word_to_alphabetic_order(anagram.word)).to eq('aast')
  end

  it 'Should order to lower case any word' do
    expect(handler.word_to_alphabetic_order('Kas')).to eq('aks')
  end
end