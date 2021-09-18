class NotificationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room-#{params['room']}:notification_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_all_streams
  end
end
