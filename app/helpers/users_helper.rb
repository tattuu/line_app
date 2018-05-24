module UsersHelper
    def log_in(user)
        session[:user_id] = user.id
    end

    # ユーザーのセッションを永続的にする
    def remember(user)
        user.remember
        cookies.permanent.signed[:user_id] = user.id
        cookies.permanent[:remember_token] = user.remember_token
    end
end
