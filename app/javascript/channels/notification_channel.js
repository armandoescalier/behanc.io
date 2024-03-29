import consumer from "./consumer"

window.onload = function () {
  consumer.subscriptions.create({ channel: "NotificationChannel", room: document.querySelector('body').dataset.userId }, {
    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      createNotification(data);
      
      setTimeout(function() {
        document.querySelector('.toastjs-btn--close')?.click();
      }, 7000);     
    }
  })
};

function createNotification(data) {
  var array_data = data.split(",")
  new Toast({
    message: array_data[0],
    type: 'success',
    customButtons: [
      {
        text: 'Check it out!',
        onClick: function () {
          window.open(array_data[1]);
        }
      }
    ]
  });
}
