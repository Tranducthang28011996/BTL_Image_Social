class NotificationsController < ApplicationController
  before_action :authenticate_user!
  def get_notification
    @notifications = current_user.passive_notifications
    render json: {
      notifications: render_to_string(partial: "notifications/notification",
              locals: {notifications: @notifications})
    }
  end
end
