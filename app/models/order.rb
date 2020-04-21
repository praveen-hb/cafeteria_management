class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :user
  def self.not_delivered
    Order.all.where(delivered_at: nil)
  end

  def self.delivered
    Order.all.where(delivered_at: (not nil))
  end

  def self.not_delivered_user(id)
    Order.all.where(delivered_at: nil, user_id: id)
  end

  def self.delivered_user(id)
    @user_order = Order.all.where(user_id: id)
    @user_order.all.where.not(delivered_at: nil)
  end

  def self.get_delivered_order_items(delivered_orders)
    order_items = []
    delivered_orders.each do |order|
      order.order_items.each do |item|
        order_items << item
      end
    end
    order_items
  end

  def self.get_not_delivered_order_items(not_delivered_orders)
    order_items = []
    not_delivered_orders.each do |order|
      order.order_items.each do |item|
        order_items << item
      end
    end
    order_items
  end

  def self.get_list(from, to)
    where("date >= ? and date <= ?", from, to)
  end

  def self.get_customer_list(from, to, id)
    @user_order = Order.all.where(user_id: id)
    @user_order.all.where("date >= ? and date <= ?", from, to)
  end
end
