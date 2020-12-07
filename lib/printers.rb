# frozen_string_literal: true

# :nodoc:
class Printers
  attr_reader :cod

  @printer = { '/Opt_A' => 'Ink, 12000 pag/ink bottle',
               '/Opt_B' => 'Ink multifunctional, 9000 pag/ink bottle',
               '/Opt_C' => 'Laser, 2000 pag/Cartridge',
               '/Opt_D' => 'Laser multifunctional, 2000 pag/Cartridge' }

  def self.show_available
    @printer.each { |cod, value| }
  end
end
