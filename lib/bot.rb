# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/BlockLength

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
        case message.text
        when '/start'
          bot.api.send_message(chat_id: message.chat.id, text: "Hello #{message.from.first_name}.
            I´ll show you the best printer options you may need based on the max number of printed pages.
            If you want my help please select '/yes' or /stop to finish this chat")
        when '/yes'
          bot.api.send_message(chat_id: message.chat.id, text: "Thanks #{message.from.first_name}.
            Select '/stop' for personal assistance or '/recommended' to give you the best printer we have.
            Otherwise choose from our list the model you are looking for: " +
            Printers.available.to_s)
        when '/stop'
          bot.api.send_message(chat_id: message.chat.id, text: "Thanks #{message.from.first_name}.
            One of our assistants will call you to be at your disposal or feel free to call us whenever you need!.")
        when '/Canon', '/HP', '/Epson'
          bot.api.send_message(chat_id: message.chat.id, text: "You can click on our in our web page
            'https://tecnomaniajl.com' if you want to buy any of those producst. Thanks for contact us")
        when '/recommended'
          bot.api.send_message(chat_id: message.chat.id, text: "You can click on our bestseller epson product
            'https://tecnomaniajl.com/Impresora-EPSON-L3150-Multifuncional-p236063653' to finish the sale. 
            Thanks for contact us")
        else
          bot.api.send_message(chat_id: message.chat.id, text: "you choose an invalid option.
            if you do not follow the links in the chat please feel free to call us and we´ll give you
              personal assistance or select '/yes' to suggest you our best available products")
        end
      end
    end
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/BlockLength
