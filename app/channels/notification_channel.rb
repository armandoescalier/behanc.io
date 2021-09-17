class NotificationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room-#{params['room']}:notification_channel"
    # stream_for current_user

    # stream_from "notification_channel_#{current_user.id}"
    # stream_from "notification_channel_user_id_8"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_all_streams
  end
end
