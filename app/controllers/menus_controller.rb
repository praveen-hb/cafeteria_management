class MenusController < ApplicationController
  def index
    if current_user.role == "owner"
      render "index"
    else
      render "/admin/error"
    end
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
    if current_user.role != "owner"
      render "/admin/error"
    else
      @id = params[:id]
      render "edit"
    end
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
    User.all.each do |user|
      user.cart = []
      user.save!
    end
    redirect_to menus_path
  end

  def destroy
    id = params[:id]
    menu = Menu.find(id)
    menu_items = menu.menu_items
    menu_items.each do |item|
      item.destroy
    end
    if menu.Standard
      User.all.each do |user|
        user.cart = []
        user.save!
      end
      menu.destroy
      temp = Menu.first
      temp.Standard = true
      temp.save!
    else
      menu.destroy
    end

    redirect_to(request.env["HTTP_REFERER"])
  end
end
