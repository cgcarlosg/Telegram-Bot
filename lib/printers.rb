# frozen_string_literal: true

# :nodoc:
class Printers
  attr_reader :cod

  @printer = { '/A' => '12000 pg',
               '/B' => '9000 pg',
               '/C' => '2000 pg',
               '/D' => '2000 pg' }

  def self.available
    @printer.each { |cod, value| }
  end
end
