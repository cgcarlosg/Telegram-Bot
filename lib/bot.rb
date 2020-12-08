# rubocop:disable Metrics/MethodLength

require 'telegram/bot'
require_relative '../lib/printers'

# :nodoc:
class Bot
  attr_reader :token, :chat_text

  def initialize
    @token = '1444483778:AAFVjyColdttvofTA6ArPJQx3JhN1Oy2azc'
    begin
      printerfinder_bot
    end
  end

  def printerfinder_bot(initial_chat = [])
    @chat_text = initial_chat

    Telegram::Bot::Client.run(token) do |bot|
      bot.listen do |message|
        case message.text
        when '/start'
          unless real_user?(message.chat.id)
            text = "Hi #{message.from.first_name}.
            anytime you can write or select '/stop' for personal assistance or '/recommended' to give
            you the best printer we have. Otherwise this is a list of available printer that could be
            the ones you are looking for: " + Printers.available.to_s
            bot.api.send_message(chat_id: message.chat.id, text: text)
          end
        when '/stop'
          bot.api.send_message(chat_id: message.chat.id, text: "Thanks #{message.from.first_name}.
            One of our assistants will call you to be at your disposal or feel free to call us whenever you need!.")
        when '/Canon', '/HP', '/Epson'
          bot.api.send_message(chat_id: message.chat.id, text: "You can click on our in our web page
            'https://tecnomaniajl.com' if you want to buy any of those producst. Thanks for contact us")
        when '/recommended'
          bot.api.send_message(chat_id: message.chat.id, text: "You can click on our bestseller epson product
            'https://tecnomaniajl.com/Impresora-EPSON-L3150-Multifuncional-p236063653' to finish the sale.")
        else
          bot.api.send_message(chat_id: message.chat.id, text: "you choose an invalid option.
            if you do not follow the links in the chat please feel free to call us and we´ll give you
              personal assistance or select '/yes' to suggest you our best available products")
        end
      end
    end
  end
end

def real_user?(chat_id = nil)
  chat_text.each do |id|
    return true if chat_id == id
  end
  false
end
# rubocop:enable Metrics/MethodLength
