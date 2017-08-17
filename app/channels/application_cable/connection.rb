module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = verify_current_user
    end

    private

    def verify_current_user
      user = User.find_by id: env['warden'].user
      return user if user
      reject_unauthorized_connection
    end
  end
end
