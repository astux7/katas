require_relative '../lib/anagram_maker.rb'

describe AnagramMaker do
  let(:maker) { AnagramMaker.new(['cat', 'refresh']) }

  it 'Initialized anagram maker with word list for anagrams' do
    expect(maker.word_list.count).to eq(2)
  end

  it 'Should create anagrams list ' do
    maker.make_anagram_list
    expect(maker.anagram_list[1]).to eq('fresher refresh')
  end

end