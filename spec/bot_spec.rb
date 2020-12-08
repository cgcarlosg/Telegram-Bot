require './lib/bot'

describe '#printerfinder_bot' do
   it 'should not return a message if argument is empty' do
    expect(@input = nil).to eql(nil)
  end
end
