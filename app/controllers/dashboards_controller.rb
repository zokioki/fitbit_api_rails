class DashboardsController < ApplicationController
  before_action :authenticate_user!
  after_action  :update_refresh_token

  def index
    @user_name = current_user.fitbit_client.profile[:user][:display_name]
    @devices = current_user.fitbit_client.devices
    @daily_summary = current_user.fitbit_client.daily_activity_summary
  end

  private

  def update_refresh_token
    new_refresh_token = current_user.fitbit_client.token.refresh_token
    current_user.identity_for("fitbit").update_attribute(:refresh_token, new_refresh_token)
  end
end
