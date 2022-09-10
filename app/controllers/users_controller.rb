class UsersController < ApplicationController
  before_action :set_user!, only: %i[edit update]

  def new
    @user = User.new
  end

  def create 
    @user = User.new user_params
    if @user.save
      sign_in 
      flash[:success] = "Welcome to the app, #{@user.name}"
      redirect_to root_path
    else
      render :new 
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name,:password, :password_confirmation,)
  end

  def set_user!
    @user = User.find params[:id]
  end
end
