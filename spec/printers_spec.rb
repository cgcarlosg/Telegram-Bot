# frozen_string_literal: true

require './lib/printers'

describe Printers do
  context '#printer' do
    it 'show avalilable information about printers in a Hash' do
      expect(Printers.available).to eq({ '/A' => '12000 pg', '/B' => '9000 pg', '/C' => '2000 pg', '/D' => '2000 pg' })
    end
  end
end
