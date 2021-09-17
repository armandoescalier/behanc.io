import consumer from "./consumer"


window.onload = function() {
consumer.subscriptions.create({channel: "NotificationChannel", room: document.querySelector('body').dataset.userId}, {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    if (Notification.permission === 'granted') {
      var title = 'New project uploaded!'
      var body = data
      var options = {
        body: body
      }
      new Notification(title, options)
    }
    // $("#notifications").prepend(data.html);

  }
})};
