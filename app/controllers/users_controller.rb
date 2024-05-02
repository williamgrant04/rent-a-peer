class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @services = @user.services
  end

  def profile
    @user = current_user
    @services = @user.services
  end

  def banner
    @user = current_user
    render partial: 'users/edit_banner_modal'
  end
end
