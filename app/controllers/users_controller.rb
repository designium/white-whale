class UsersController < ApplicationController

  before_filter :authorize, :except => [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      cookies[:auth_token] = @user.auth_token
      redirect_to root_url
    else
      render "new"
    end
  end

  def dashboard
    @locators = Locator.current_user_locators(@current_user).top_locators
    @media = Medium.current_user_media(@current_user).top_media
  end

  def my_account
    
  end

  def create_qr_codes
    #redirect_to login_url, alert: "Please, log in first." unless current_user
    @locator = Locator.new
    @locators = Locator.current_user_locators(@current_user)
    @medium = Medium.new
    @media = Medium.current_user_media(@current_user)
    @trackers = Tracker.current_user_trackers(@current_user)
  end
end
