# メッセージを即時更新する機能を、Action Cableを用いて実装します。Action Cableは、通常のRailsのアプリケーションと同様の記述で、即時更新機能を実装できるフレームワークです。実装内容としては、メッセージの保存や送信に必要なRubyのコーディングと、保存したメッセージを即時に表示させるJavaScriptのコーディングです。
# メッセージを即座に表示させるために、データの経路を設定したり、送られてきたデータを表示させるJavaScriptを記述したりします。これらの役割をChannel（チャネル）が担っています。チャネルとは、即時更新機能を実現するサーバー側の仕組みのことをいいます。上記に示した通り、データの経路を設定したり、送られてきたデータをクライアントの画面上に表示させたりします。

class MessageChannel < ApplicationCable::Channel
  # このファイルは、サーバーとクライアントを繋ぐファイルです。MVCでいうところのルーティングの機能を果たします。

  def subscribed
    stream_from "message_channel"
  end
  # stream_fromメソッドを用いることで、サーバーとクライアントの関連付けを設定します。stream_fromとは、サーバーとクライアントを関連付けるメソッドです。Action Cableにあらかじめ用意されています。これでサーバーとクライアントを関連付けるための設定ができました。stream_fromメソッドで関連付けられるデータの経路のことを、broadcast（ブロードキャスト）と呼びます。broadcastとは、サーバーから送られるデータの経路のことを指します。broadcastを介してデータをクライアントに送信します。

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
