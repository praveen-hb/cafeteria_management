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

  def updation
    id = params[:id]
    menu = Menu.find(id)
    menu.name = params[:name]
    menu.save!
    redirect_to(request.env["HTTP_REFERER"])
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

  def destroy
    id = params[:id]
    menu = Menu.find(id)
    menu.destroy
    menu_items = MenuItem.all.where("menu_id = ?", id)
    menu_items.each do |item|
      item.destroy
    end
    redirect_to(request.env["HTTP_REFERER"])
  end
end
