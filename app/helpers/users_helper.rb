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

    def sms_send(user)
        account_sid = "AC431bb5c0cd0851755991cf3adc91cd21" 
        auth_token = "06b596c4490be6ae31ca2e4c6d908256" 
        @client = Twilio::REST::Client.new account_sid, auth_token
        from = '+14124073609' # Your Twilio number
        to = '+81' + user.phone # Your mobile phone number

        random = Random.new()
        sms_auth = random.rand(9999)
        sms_auth = format("%04d", sms_auth)

        @client.messages.create(
        from: from,
        to: to,
        body: sms_auth
        )

        user.sms = sms_auth
        user.save
    end
end
