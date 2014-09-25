require_relative '../lib/text_generator.rb'

describe TextGenerator do
  let(:text_g) { TextGenerator.new(4, {"I wish" => ["I", "I"],
                                        "wish I" => ["may", "might"],
                                        "may I"  => ["wish"],
                                        "I may"  => ["I"]}) }

  it 'Initialized anagram maker with word list for anagrams' do
    expect(text_g.text).to eq([])
  end

  it 'Should made random 2 words start' do
    key = text_g.random_start_keys.join(' ')
    expect(text_g.key_words_set.has_key?(key)).to be true
  end

  it 'Should find the extention ' do
    key = text_g.random_start_keys.join(' ')
    text = text_g.generate_neighbor(key)
    expect(text_g.key_words_set[key][0]).to eq(text)
  end

  it 'should show the story' do
    text_g.generate_text
    expect(text_g.show_the_story.split("I wish").empty?).to eq(false) 
  end

end