
    class Admin::UsersController < ApplicationController
        before_action :require_authentication
        before_action :set_user!, only: %i[edit update destroy]
        # before_action :authorize_user!
        # after_action :verify_authorized

        def index 
            @users = User.order(created_at: :desc)
        end

        def destroy
            # перенести в current user?
            unless @user.id == current_user.id 
                @user.destroy
            else
                flash[:warning] = 'you trying to delete yourself'
            end
            redirect_to admin_users_path
        end

        def edit

        end

        def update 
            if @user.update user_params
                flash[:success] = t '.success'
                redirect_to admin_users_path
            else
                render :edit 
            end
        end

        def set_user!
            @user = User.find params[:id]
        end

        def user_params 
            params.require(:user).
                permit(:email, :name, :password_confirmation, :role).
                merge(admin_edit: true)
        end
    end

