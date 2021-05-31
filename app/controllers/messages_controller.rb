class MessagesController < ApplicationController
  def new
    @messages = Message.all
    @message = Message.new
  end

  def create
    @message = Message.new(text: params[:message][:text])
    if @message.save
      ActionCable.server.broadcast 'message_channel', content: @message
    end
    # メッセージの保存が成功したときに、broadcastを介してメッセージが送信されるように記述します。broadcastとは、サーバーから送られるデータの経路のことを指します。broadcastを介してデータをクライアントに送信します。追記した「ActionCable.server.broadcast 'message_channel', content: @message」は、broadcastを通して、'message_channel'に向けて@messageを送信するということです。送信された情報は、message_channel.jsで受け取ります。
  end
end
