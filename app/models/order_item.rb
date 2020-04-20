class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :menu_item
  def self.ordered_items(id)
    OrderItem.all.where(order_id: id)
  end
end
