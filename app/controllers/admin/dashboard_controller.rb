class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["ADMIN_USERNAME"], password: ENV["ADMIN_PASSWORD"]
  
  def show
    @products = Product.count
    @categories = Category.count
  end
end
