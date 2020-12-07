# frozen_string_literal: true

# :nodoc:
class Printers
  attr_reader :printer

  @printer = ['/Canon G4111', '/Epson L3150', '/HP 7740', nil]

  def self.available
    @printer.reject(&:nil?)
  end

  def self.suggested_printer
    @printer[1]
  end
end
