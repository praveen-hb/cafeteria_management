class MenusController < ApplicationController
  def index
    render "index"
  end

  def show
    @id = params[:id]
    @menu = Menu.find(@id)
    @name = @menu.name
    @menu_items = @menu.menu_items.order(:id)
    render "show"
  end
end
