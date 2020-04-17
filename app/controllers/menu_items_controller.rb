class MenuItemsController < ApplicationController
  def index
    @menu_items = Menu.Standard.menu_items.order(:id)
    render "index"
  end

  def update
    selected = params[:selected]
    menu_item = MenuItem.find(params[:id])
    menu_item.selected = selected
    menu_item.save!
    redirect_to menu_items_path
  end

  def create
    menu_item_name = params[:name]
    menu_item_price = params[:price]
    description = params[:description]
    id = params[:id]
    menu = MenuItem.create!(
      name: menu_item_name,
      price: menu_item_price,
      menu_id: id,
      description: description,
      selected: false,
    )
    redirect_to(request.env["HTTP_REFERER"])
  end

  def destroy
    id = params[:id]
    menu_item = MenuItem.find(id)
    menu_item.destroy
    redirect_to(request.env["HTTP_REFERER"])
  end
end
