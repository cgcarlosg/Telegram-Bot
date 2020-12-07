require './lib/printers'

describe Printers do
  context '#printer' do
    it 'show avalilable information about printers in an array' do
      expect(Printers.available).to eq(['/Canon G4111', '/Epson L3150', '/HP 7740'])
    end
  end
  describe '#suggested_printer' do
    it 'the suggested printer is the one selected to be shown' do
      expect(Printers.suggested_printer).to include '/Epson L3150'
    end
  end

  describe '#available' do
    it 'the available method does not include nil elements' do
      expect(Printers.available).not_to include nil
    end
  end
end
