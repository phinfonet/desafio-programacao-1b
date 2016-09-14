# -*- encoding : utf-8 -*-
module OrdersHelper
  def total_price(order)
    order.unit_price * order.quantity
  end

  def total_receipt(orders)
    orders.map {|order| total_price(order) }.inject(:+)
  end
end
