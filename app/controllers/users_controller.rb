class UsersController < ApplicationController
  def show
    @user = current_user
    @services = []
  end

  def banner
    @user = current_user
    render partial: 'users/edit_banner_modal'
  end

  def update_banner
    
  end
end
