class UsersController < ApplicationController
  def show
    @user = current_user
    @services = []
    @user.services.each { |service| @services << service }
  end

  def banner
    @user = current_user
    render partial: 'users/edit_banner_modal'
  end

  def update_banner

  end
end
