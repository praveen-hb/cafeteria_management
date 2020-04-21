class OrdersController < ApplicationController
  def index
    if current_user.role == "customer"
      render "/admin/error"
    else
      @not_delivered_orders = Order.not_delivered
      render "index"
    end
  end

  def create
    new_order = Order.create!(
      date: Date.today,
      user_id: @current_user.id,
      delivered_at: nil,
      value: params[:value].to_i,
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
    render "orders/show"
  end

  def invoices
    @orders = Order.get_list(params[:from_date], params[:to_date])
    session[:orders] = @orders
    redirect_to reports_path
  end

  def customer_invoices
    @orders = Order.get_customer_list(params[:from_date], params[:to_date], params[:customer_id])
    session[:orders] = @orders
    redirect_to reports_path
  end
end
