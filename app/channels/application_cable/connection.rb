module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user
    identified_by :talk_id

    def connect
      self.current_user = find_verified_user
      if current_talk = CurrentTalk.where(user_id: self.current_user.id).order(created_at: :DESC).to_a[0]
        self.talk_id = current_talk.talk_params
      else
        self.talk_id = nil
      end
    end

    protected
    def find_verified_user
      if verified_user = User.find_by(id: cookies.signed[:user_id])
        verified_user
      else
        reject_unauthorized_connection
      end
    end
  end
end
