class OrderItemsController < ApplicationController
  def create
    @temp = menu_items.selected_ones
    @temp.each do |t|
      OrderItem.create!(
        order_id: 1,
        menu_item_id: t.menu_item_id,
        menu_item_name: t.menu_item_name,
        menu_item_price: t.menu_item_price,
      )
    end
    render plain: "order items created"
  end
end
