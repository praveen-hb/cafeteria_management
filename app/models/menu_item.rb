class MenuItem < ApplicationRecord
  belongs_to :menu

  def self.selected
    MenuItem.all.where(selected: true)
  end

  def self.store_current_items
    @items = Menu.Standard.menu_items.order(:id)
  end

  def self.get_current_items
    @items
  end

  def self.store_cart(ids)
    @ids = ids
  end

  def self.get_cart
    @ids
  end
end
