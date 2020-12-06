# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength
# frozen_string_literal: true

require 'telegram/bot'
require_relative '../lib/printers'
# :nodoc:
class Bot
  def initialize
    token = '1473916105:AAELTf_XfjmmePztuIKTfnir_AXJTe8woMo'

    Telegram::Bot::Client.run(token) do |bot|
      bot.listen do |message|
        begin
          @input = message.text[%r{/([a-zA-Z]+)}]
          puts @input
        rescue StandardError => e
          log.fatal(e)
          log.fatal(message.text)
        else
          case @input
          when '/start'
            bot.api.send_message(chat_id: message.chat.id, text: "Hello #{message.from.first_name}.
            My job is showing you options to help you decide which kind of printer you need.
            If you want my help please select '/yes' otherwise select '/no'")
          when '/yes'
            bot.api.send_message(chat_id: message.chat.id, text: "Thanks #{message.from.first_name}.
            Select one of our best printers available: " + Printers.show_available.to_s)
          when '/Opt'
            bot.api.send_message(chat_id: message.chat.id, text: "You´ll be redirected to our web page
            'https://tecnomaniajl.com' in order to finish the sale")
          end
        end
      end
    end
  end
end
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/MethodLength
