module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
      logger.debug("33")
    end

    protected

    def find_verified_user
      if current_user = User.find_by(id: cookies.signed[:user_id])
        logger.debug("4")
        current_user
      else
        logger.debug("5")
        reject_unauthorized_connection
      end
    end

    def session
      logger.debug("6")
      cookies.encrypted[Rails.application.config.session_options[:key]]
    end
  end
end
