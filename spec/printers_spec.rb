# frozen_string_literal: true

require './lib/printers'

describe Printers do
  context '#printer' do
    it 'show avalilable information about printers in a Hash' do
      expect(Printers.show_available).to eq({ '/Opt_A' => 'Ink, 12000 pag/ink bottle', '/Opt_B' => 'Ink multifunctional, 9000 pag/ink bottle', '/Opt_C' => 'Laser, 2000 pag/Cartridge', '/Opt_D' => 'Laser multifunctional, 2000 pag/Cartridge' })
    end
  end
end
