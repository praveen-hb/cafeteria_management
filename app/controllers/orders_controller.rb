class OrdersController < ApplicationController
  def index
    @not_delivered_orders = Order.not_delivered
    render "orders/show"
  end

  def update
    id = params[:id]
    order = Order.find(id)
    order.delivered_at = DateTime.now
    order.save!
    #render "tried to mark as complete"
    redirect_to orders_path
  end
end
