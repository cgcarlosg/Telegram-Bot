require './lib/bot'

RSpec.describe Telegram::Bot do
  it 'works as a that receives and return data, it is not a string' do
    expect(described_class).not_to eq(String)
  end
end

describe '#printerfinder_bot' do  
  let(:chat_text) {  }
  it 'should not return a message if argument is empty' do
    expect(chat_text).to eql(nil)
  end
end

describe '#real_user?' do  
  let(:chat_id) { '123456789' }
  let(:chat_text) { [] }
  it 'should return false if there is not any chat_id valid' do
    expect(real_user?).to eql(false)
  end
end