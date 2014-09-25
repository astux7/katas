require_relative '../lib/bloom_filter.rb'

describe BloomFilter do
  let(:bloomf) { BloomFilter.new('python') }

  it 'Initialized bloom filter' do
    expect(bloomf.word).to eq('python')
  end
  
  it 'Should create a hash h1 for word' do
    expect(bloomf.send(:hash_1, bloomf.word)).to eq(2)
  end

  it 'Should create a hash h2 for word' do
    expect(bloomf.send(:hash_2, bloomf.word)).to eq(4)
  end

  it 'Should create a hash h3 for word' do
    expect(bloomf.send(:hash_3, bloomf.word)).to eq(3)
  end

  it 'Should create a hash h4 for word' do
    expect(bloomf.send(:hash_4, bloomf.word)).to eq(4)
  end
  # if sort order word [2,4,3,4]
  it 'Should create a hashes result array for word' do
    expect(bloomf.send(:create_hashes, bloomf.word)).to eq([2,4,3,4])
  end
  # if sort order word [0,1,1,0,2,0,0,0,0,0] for [4,4,1,2]
  it 'Should create a bit map size of bitmap_size ' do
    bloomf.send(:create_word_bit_map, bloomf.word)
    expect(bloomf.word_bit_map).to eq([0, 0, 1, 1, 2, 0, 0, 0, 0, 0])
  end

  it 'Should return propability of fiting filter word' do
    expect(bloomf.send(:calculate_dictionary_word_correlation,[0,1,1,0,1,0,0,0,0,0])).to be_between(40, 100)
  end
  it 'Should return propability of not fiting filter word' do
    expect(bloomf.send(:calculate_dictionary_word_correlation,[0,0,1,0,0,1,0,0,0,0])).to be_between(0, 30)
  end
  it 'Should return suggestion word collection empty' do
      bloomf.send(:check_for_suggestions_set,'pythik')
      expect(bloomf.suggestion_words_set).to be_empty
  end
  
  it 'Should return not empty suggestion collection' do
      bloomf.send(:check_for_suggestions_set,'pythno')
      expect(bloomf.suggestion_words_set.count).to eql(1)
  end
end