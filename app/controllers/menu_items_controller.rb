class MenuItemsController < ApplicationController
  def index
    @menu_items = MenuItem.get_current_items
    @role = current_user.role
    render "index"
  end

  def edit
    @id = params[:id]
    render "edit"
  end

  def cart
    @menu_items = MenuItem.get_current_items
    @menu_q = @menu_items.map { |item| params[item.id.to_s.to_sym] }
    if @current_user.cart == []
      @menu_q.each do |id|
        @current_user.cart << id.to_i
      end
    else
      i = 0
      @menu_q.each do |id|
        @current_user.cart[i] += id.to_i
        i += 1
      end
    end
    @current_user.save!
    redirect_to menu_items_path
  end

  def cart_items
    @menu_items = MenuItem.get_current_items
    @menu_ids = @menu_items.map { |item| item.id }
    @id_quantity = @menu_ids.zip(@current_user.cart)
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
    @menu_items = MenuItem.get_current_items
    @menu_ids = @menu_items.map { |item| item.id }
    i = 0
    @menu_ids.each do |id|
      if id == params[:id].to_i
        if params[:op] == "del"
          @current_user.cart[i] = 0
        elsif params[:op] == "up"
          @current_user.cart[i] += 1
        else
          @current_user.cart[i] -= 1
        end
      end
      i += 1
    end
    @current_user.save!
    #redirect_to menu_items_cart_items_path
    redirect_to(request.env["HTTP_REFERER"])
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

    )
    if Menu.find(id).Standard
      User.all.each do |user|
        user.cart = []
        user.save!
      end
    end
    redirect_to(request.env["HTTP_REFERER"])
  end

  def destroy
    id = params[:id]
    menu_item = MenuItem.find(id)
    if menu_item.menu.Standard
      User.all.each do |user|
        user.cart = []
        user.save!
      end
    end
    menu_item.destroy
    redirect_to(request.env["HTTP_REFERER"])
  end
end
