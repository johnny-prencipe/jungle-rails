class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['HTTP_USER'], password: ENV['HTTP_PASSWORD']
  
  def show
    @products = Product.all
    @categories_length = Category.all.length

    @stock = 0

    @products.each do |item|
      @stock += item.quantity
    end
    
  end
end