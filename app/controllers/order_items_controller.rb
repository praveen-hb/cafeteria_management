class OrderItemsController < ApplicationController
  def create
    menu_items = MenuItem.selected
    new_order = Order.create!(
      date: Date.today,
      user_id: 1,
    )
    menu_items.each do |item|
      OrderItem.create!(
        order_id: new_order.id,
        menu_item_id: item.id,
        menu_item_name: item.name,
        menu_item_price: item.price,
      )
    end
    MenuItem.all.each do |item|
      item.selected = false
      item.save!
    end
    redirect_to menu_items_path
  end
end
