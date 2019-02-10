class AlumniChannel < ApplicationCable::Channel
  def subscribed
    stream_from "alumni_channel" unless signed_in_user.is_an_admin
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
