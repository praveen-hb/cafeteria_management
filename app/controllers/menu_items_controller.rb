class MenuItemsController < ApplicationController
  def index
    MenuItem.store_current_items
    @menu_items = MenuItem.get_current_items
    render "index"
  end

  def edit
    @id = params[:id]
    render "edit"
  end

  def cart
    @menu_items = MenuItem.get_current_items
    @menu_q = @menu_items.map { |item| params[item.id.to_s.to_sym] }
    MenuItem.store_cart(@menu_q)
    redirect_to menu_items_path
  end

  def cart_items
    @cart = MenuItem.get_cart
    render "cart"
  end

  def updation
    id = params[:id]
    menu_item = MenuItem.find(id)
    menu_item.name = params[:name]
    menu_item.price = params[:price]
    menu_item.description = params[:description]
    menu_item.save!
    redirect_to(request.env["HTTP_REFERER"])
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
