import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // 受け取った情報は、receivedの引数dataに入ります。
    const html = `<p>${data.content.text}</p>`;
    // 受け取ったdataのなかにあるcontentのなかのtextを表示します。contentはコントローラーのcreateアクション内で指定したcontentからきています。contentは@messageと同義なので、textを取り出せるというわけです。
    const messages = document.getElementById('messages');
    const newMessage = document.getElementById('message_text');
    messages.insertAdjacentHTML('afterbegin', html);
    newMessage.value='';
  }
});
