class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with username: ENV["ADMIN_USERNAME"], password: ENV["ADMIN_PASSWORD"]
  before_action :authenticate
  
  def show
  end

  private
  def authenticate
    http_basic_authenticate_with username: ENV["ADMIN_USERNAME"], password: ENV["ADMIN_PASSWORD"]
  end
end
