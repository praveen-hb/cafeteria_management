class MenuItemsController < ApplicationController
  def index
    render "index"
  end

  def update
    selected = params[:selected]
    menu_item = MenuItem.find(params[:id])
    menu_item.selected = selected
    menu_item.save!
    redirect_to menu_items_path
  end
end
