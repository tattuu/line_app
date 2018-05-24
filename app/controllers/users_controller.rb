class UsersController < ApplicationController
  include UsersHelper
  def index
  end

  def login

    require 'twilio-ruby'

    account_sid = "AC431bb5c0cd0851755991cf3adc91cd21" 
    auth_token = "06b596c4490be6ae31ca2e4c6d908256" 
    @client = Twilio::REST::Client.new account_sid, auth_token
    from = '+14124073609' # Your Twilio number
    to = '+81' +  params[:phone] # Your mobile phone number

    random = Random.new()
    sms_auth = random.rand(9999)
    sms_auth = format("%04d", sms_auth)

    @client.messages.create(
    from: from,
    to: to,
    body: sms_auth
    )

    @user = User.find_by(name: params[:phone])
    # バリデーションをする！(電話番号しか受け付けない！)
    if @user
      @user.sms = sms_auth
      @user.save
      flash[:notice] = "あとちょっと！"
      redirect_to("/login/#{@user.id}")
    else
      User.create!(name: params[:phone])
      @user = User.find_by(name: params[:phone])
      @user.sms = sms_auth
      @user.save
      redirect_to("/login/#{@user.id}")
    end
  end

  def sms

  end

  def sms_auth
       
    @user = User.find_by(id: params[:id])
    if @user.sms == params[:password]
      @user.sms = ""
      @user.save
      flash[:notice] = "Welcome!"
      log_in @user
      remember @user
      redirect_to("/rooms/show")
    else
      flash.now[:danger] = 'Invalid phone_num/auth_num combination'
      render("users/sms")
    end
  end

  def top
    
  end

end
