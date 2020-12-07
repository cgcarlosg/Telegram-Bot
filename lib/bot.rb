# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/BlockLength
# frozen_string_literal: true

require 'telegram/bot'
require_relative '../lib/printers'
# :nodoc:
class Bot
  def initialize
    token = '1473916105:AAELTf_XfjmmePztuIKTfnir_AXJTe8woMo'

    Telegram::Bot::Client.run(token) do |bot|
      bot.listen do |message|
        @input = message.text
        case @input
        when '/start'
          bot.api.send_message(chat_id: message.chat.id, text: "Hello #{message.from.first_name}.
            I´ll show you the best printer options you may need based on the max number of printed pages.
            If you want my help please select '/yes' otherwise select '/no'")
        when '/yes'
          bot.api.send_message(chat_id: message.chat.id, text: "Thanks #{message.from.first_name}.
            Select '/none' to ask for a personal assistant or choose one of our best printers available: " +
          Printers.show_available.to_s)
        when '/no'
          bot.api.send_message(chat_id: message.chat.id, text: "Thanks #{message.from.first_name}.
            One of our assistants will call you to be at your disposal")
        when '/A', '/B', '/C', '/D'
          bot.api.send_message(chat_id: message.chat.id, text: "You´ll be redirected to our web page
            'https://tecnomaniajl.com' in order to finish the sale. Thanks for contact us")
        when '/none'
          bot.api.send_message(chat_id: message.chat.id, text: "Thanks #{message.from.first_name}.
            It´s been a pleasure, please feel free to call us for any additional assistance")
        else
          bot.api.send_message(chat_id: message.chat.id, text: "you choose an invalid option.
            if you do not follow the links in the chat please feel free to call us and we´ll give you
              personal assistance or select '/yes' to suggest you our best available products")
        end
      end
    end
  end
end
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/BlockLength
