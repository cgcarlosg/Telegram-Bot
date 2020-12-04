#!/usr/bin/env ruby
require_relative '../lib/bot.rb'
token = "1473916105:AAELTf_XfjmmePztuIKTfnir_AXJTe8woMo"
Telegram::Bot::Client.run(token) do |bot|
    bot.listen do |message|
        input = message.text
        p input + " otro linea"
          bot.api.send_message(chat_id: message.chat.id, text: "Hello, I´m a bot")
    end
    end