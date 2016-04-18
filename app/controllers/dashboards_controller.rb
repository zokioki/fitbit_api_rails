class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @devices = current_user.fitbit_client.devices
    @daily_summary = current_user.fitbit_client.daily_activity_summary
  end
end
