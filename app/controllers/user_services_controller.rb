class UserServicesController < ApplicationController
  def new
    @user_service = UserService.new
    services = []
    Service.all.each { |service| services << service.name }
    @service_names = services
  end

  def create
    @user_service = UserService.new
    @user_service.service = Service.find_by(name: user_service_params[:service])
    @user_service.user = current_user
    if @user_service.save
      redirect_to profile_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @user_service = UserService.find(params[:id])
    @user_service.destroy
  end

  private

  def user_service_params
    params.require(:user_service).permit(:service)
  end
end
