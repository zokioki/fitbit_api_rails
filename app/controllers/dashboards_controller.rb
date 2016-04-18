class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_name = current_user.fitbit_client.profile[:user][:display_name]
    @devices = current_user.fitbit_client.devices
    @daily_summary = current_user.fitbit_client.daily_activity_summary
  end
end
