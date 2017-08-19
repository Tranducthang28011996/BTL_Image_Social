module ApplicationHelper
  def render_notify_block notify
    case notify.notify_type
    when "follow"
      render partial: "notifications/notify_follow", locals: {notify: notify}
    else
      render partial: "notifications/notify_photo", locals: {notify: notify}
    end
  end
end
