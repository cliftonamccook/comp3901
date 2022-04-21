class UsersController < ApplicationController
  include UsersHelper

  before_action :set_user, only: %i[ show edit update destroy activate_account deactivate_account reset_password ]
  before_action :authenticate_user!
  before_action :only_admin!

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    @user.password = User::DEFAULT_PASSWORD

    respond_to do |format|
      if @user.save
        send_credentials(@user)
        format.html { redirect_to users_path, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update 
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  def reset_password
    @user.update(password: User::DEFAULT_PASSWORD)
    flash[:notice] = "New Password was send to user's email address"
    send_credentials(@user)
    redirect_to users_path
  end

  def activate_account
    @user.activate_account
    @user.update(password: User::DEFAULT_PASSWORD)
    send_credentials(@user)
    respond_to do |format|
      format.html { redirect_to users_path, success: "User's account was activated, they may now sign in" }
      format.json { head :no_content }
    end
  end

  def deactivate_account
    @user.deactivate_account
    respond_to do |format|
      format.html { redirect_to users_path, alert: "User's account was deactivated, they can no longer access the system" }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def send_credentials(user)
      UserNotificationMailer.send_credentials(user).deliver_later
    end

    def user_params
      params.require(:user).permit(:email, :uwi_id, :campus_id, :department_id, :title, :first_name, :middle_names, :last_name, :gender, :account_type, :permission_group_id)
    end
end
