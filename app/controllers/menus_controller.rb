class MenusController < ApplicationController
  def index
    render "index"
  end

  def show
    @id = params[:id]
    menu = Menu.find(@id)
    @name = menu.name
    @menu_items = menu.menu_items.order(:id)
    render "show"
  end

  def create
    menu_name = params[:name]
    menu = Menu.create!(
      name: menu_name,
    )
    redirect_to menus_path
  end

  def edit
    @id = params[:id]
    render "edit"
  end

  def update
    Menu.all.each do |menu|
      menu.Standard = false
      menu.save!
    end
    menu = Menu.find_by(name: params[:Standard])
    menu.Standard = true
    menu.save!
    redirect_to menus_path
  end
end
