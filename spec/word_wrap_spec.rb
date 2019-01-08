require_relative '../lib/word_wrap'

describe 'word_wrap' do
  it 'returns an empty string when called with nothing' do
    expect(word_wrap('', 1)).to eq('')
  end

  it 'returns the word if equal to the max length' do
    expect(word_wrap('word', 4)).to eq('word')
  end

  it 'returns the word if shorter than the max length' do
    expect(word_wrap('word', 5)).to eq('word')
  end

  it 'breaks up a long word with a newline' do
    expect(word_wrap('longword', 4)).to eq("long\nword")
  end

  it 'breaks up a very long word with two newlines' do
    expect(word_wrap('verylongword', 4)).to eq("very\nlong\nword")
  end

  it 'wraps before word boundary' do
    expect(word_wrap('long word', 4)).to eq("long\nword")
  end

  it 'wraps on word boundary' do
    expect(word_wrap('long word', 5)).to eq("long\nword")
  end

  it 'wraps after word boundary' do
    expect(word_wrap('long word', 6)).to eq("long\nword")
  end

  it 'keeps as many words as possible on the line' do
    expect(word_wrap('very long word', 10)).to eq("very long\nword")
  end
end