# frozen_string_literal: true

require './lib/bot'

RSpec.describe Telegram::Bot do
  it 'return with defined messages' do
    expect(described_class).to be
  end

  it 'should not return a message if argument is empty' do
    expect(@input = nil).to eql(nil)
  end
end
