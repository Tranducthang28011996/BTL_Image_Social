class NotificationsController < ApplicationController
  before_action :authenticate_user!
  def get_notification
    @notification = current_user.passive_notifications
  end
end
