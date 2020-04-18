class OrdersController < ApplicationController
  def index
    @not_delivered_orders = Order.not_delivered
    render "orders/show"
  end

  def create
    new_order = Order.create!(
      date: Date.today,
      user_id: @current_user.id,
      delivered_at: nil,
    )
    new_order.save!
    redirect_to "/order_items/#{new_order.id}/edit"
  end

  def update
    id = params[:id]
    order = Order.find(id)
    order.delivered_at = DateTime.now
    order.save!
    redirect_to orders_path
  end

  def display
    @not_delivered_orders = Order.not_delivered_user(current_user.id)
    @delivered_orders = Order.delivered_user(current_user.id)
    render "orders/index"
  end
end
