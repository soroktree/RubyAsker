class UsersController < ApplicationController
  before_action :require_no_authentication, only: %i[new create]
  before_action :require_authentication, only: %i[edit update]
  before_action :set_user!, only: %i[edit update]

  before_action :authorize_user!
  after_action :verify_authorized 

  def new
    @user = User.new
  end

  def update
    if @user.update questions_params
      flash[:success] = "Data successfully updated!"
      redirect_to root_path
    else
      render :edit
    end
  
  end

  def create 
    @user = User.new user_params
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the app, #{@user.name}"
      redirect_to root_path
    else
      render :new 
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end

  def set_user!
    @user = User.find params[:id]
  end

  def authorize_user!
      authorize ( @user || User )
  end
end
