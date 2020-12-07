# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/BlockLength
# frozen_string_literal: true

require 'telegram/bot'
require_relative '../lib/printers'

# :nodoc:
class Bot
  attr_reader :token

  def initialize
    @token = '1444483778:AAFVjyColdttvofTA6ArPJQx3JhN1Oy2azc'
    begin
      printerfinder_bot
    rescue Telegram::Bot::Exceptions::ResponseError => e
      puts "#{e} Bot not connected. Please try again"
    end
  end

  def printerfinder_bot
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
            Printers.available.to_s)
        when '/no'
          bot.api.send_message(chat_id: message.chat.id, text: "Thanks #{message.from.first_name}.
            One of our assistants will call you to be at your disposal")
        when '/Canon'
          bot.api.send_message(chat_id: message.chat.id, text: "You can click on our best canon product in our web
            'https://tecnomaniajl.com/Impresora-Canon-G4111-Multifuncional-Wif-Adf-Original-5-Tintas-p217378167'
             if you want to buy the product. Thanks for contact us")
        when '/Epson'
          bot.api.send_message(chat_id: message.chat.id, text: "You can click on our bestseller epson product in our web
            'https://tecnomaniajl.com/Impresora-EPSON-L3150-Multifuncional-p236063653'
             if you want to buy the product. Thanks for contact us")
        when '/HP'
          bot.api.send_message(chat_id: message.chat.id, text: "You can click on our most complete HP printer in our web
            'https://tecnomaniajl.com/Impresora-Hp-7740-Multifuncional-p239999030'
             if you want to buy the product. Thanks for contact us")
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
