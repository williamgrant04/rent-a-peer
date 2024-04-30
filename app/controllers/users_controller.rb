class UsersController < ApplicationController
  def show
    @user = current_user
    @services = @user.services
  end
end
