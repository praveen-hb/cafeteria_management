class OrderItemsController < ApplicationController
  def edit
    @menu_items = MenuItem.get_current_items
    @menu_ids = @menu_items.map { |item| item.id }
    @id_quantity = @menu_ids.zip(@current_user.cart)
    "" "
    new_order = Order.create!(
      date: Date.today,
      user_id: @current_user.id,
      delivered_at: nil,
    )
    " ""
    new_order = params[:id]
    @id_quantity.each do |item, quantity|
      if quantity > 0
        OrderItem.create!(
          order_id: new_order,
          menu_item_id: item,
          menu_item_name: MenuItem.find(item).name,
          menu_item_price: MenuItem.find(item).price,
          menu_item_quantity: quantity,
        )
      end
    end

    redirect_to menu_items_path
  end
end
