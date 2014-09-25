require_relative '../lib/automatic_teacher.rb'

describe AutomaticTeacher do
  let(:teacher) { AutomaticTeacher.new }

  it 'Initialized automatic teacher' do
    expect(teacher.keyword_set).to eq({})
  end

  it 'Should init 3 words' do
    line = ['one','two','three']
    teacher.init_words(line)
    init_set = [teacher.first,teacher.second,teacher.third]
    expect(init_set).to eq(line)
  end

  it 'Should have entry in keyword_set' do
    line = ['one','two','three']
    teacher.init_words(line)
    init_set = [teacher.first,teacher.second,teacher.third]
    expect(teacher.keyword_set).to eq({"one two" => ['three']})
  end

  it 'Should return nothing if first string less then 3 words' do
    line = "I wish"
    teacher.format_keyword_set(line)
    expect(teacher.keyword_set).to eq({})
  end

  it 'Should made a new word set shifted by 1 word' do 
    line = ['one','two','three']
    teacher.init_words(line)
    teacher.make_key_word_set('four')
    expect(teacher.keyword_set).to eq({"one two" => ['three'], "two three" => ['four']})
  end

  it 'Should increase the number of same key word array size' do 
    line = ['I' ,'wish', 'I']
    teacher.init_words(line)
    teacher.make_key_word_set('may')
    teacher.make_key_word_set('I')
    teacher.make_key_word_set('wish')
    teacher.make_key_word_set('I')
    teacher.make_key_word_set('might')
    expect(teacher.keyword_set).to eq({"I wish" => ["I", "I"],
                                        "wish I" => ["may", "might"],
                                        "may I"  => ["wish"],
                                        "I may"  => ["I"]})
  end

  it 'Should make nice keyword_set ' do
    line = "I wish I may I wish I might"
    teacher.format_keyword_set(line)
    expect(teacher.keyword_set).to eq({"I wish" => ["I", "I"],
                                        "wish I" => ["may", "might"],
                                        "may I"  => ["wish"],
                                        "I may"  => ["I"]})
  end
end