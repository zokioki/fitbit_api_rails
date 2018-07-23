class DashboardsController < ApplicationController
  before_action :authenticate_user!
  before_action :update_token_data

  def index
    @user_name = current_user.fitbit_client.profile[:user][:display_name]
    @devices = current_user.fitbit_client.devices
    @daily_summary = current_user.fitbit_client.daily_activity_summary
  end

  private

  def update_token_data
    token_data = current_user.fitbit_client.token
    current_user.identity_for("fitbit").update_attributes(
      access_token: token_data.token,
      refresh_token: token_data.refresh_token,
      expires_at: token_data.expires_at
    )
  end
end
