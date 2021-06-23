# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :find_user, except: :index

  def index
    @users = User.page(params[:page])
  end

  def destroy
    @user.destroy
    flash[:danger] = 'User profile has been deleted'
    redirect_to users_path
  end

  def update
    if @user.update(user_params)
      flash[:success] = "User profile \"#{@user.decorate.full_name}\"  updated"
      redirect_to @user
    else
      flash.now[:warning] = 'Invalid parameters for editing!'
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :avatar)
  end

  def find_user
    @user ||= User.find(params[:id])
  end
end
