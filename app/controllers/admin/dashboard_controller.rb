class Admin::DashboardController < ApplicationController
  # http_basic_authenticate_with username: ENV["ADMIN_USERNAME"], password: ENV["ADMIN_PASSWORD"]
  include HttpAuthConcern
  # before_action :authenticate
  
  def show
  end

  # private
  # def authenticate
  #   self.http_basic_authenticate_with username: ENV["ADMIN_USERNAME"], password: ENV["ADMIN_PASSWORD"]
  # end
end
