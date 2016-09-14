# -*- encoding : utf-8 -*-
class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def upload
    @order = Order.new
  end

  def store_from_file
    file = File.read(params[:order][:file].path)
    parsed_file = Order.parse(file)
    create_orders_transactionally(parsed_file)
    flash[:message] = "Orders added Successfully!"
    redirect_to root_path
  end

  private

  def create_orders_transactionally(file)
    Order.transaction do
      file.select do |line|
        Order.create(line)
      end
    end
  end
end
