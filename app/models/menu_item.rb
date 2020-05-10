class MenuItem < ApplicationRecord
  belongs_to :menu
  validates :name, presence: true
  validates :price, presence: true

  def self.selected
    MenuItem.all.where(selected: true)
  end
  def self.get_current_items
    Menu.Standard.menu_items.order(:id)
  end
  def self.get_cart_value(id_quantity)
    total = 0
    id_quantity.each do |item, quantity|
      total += MenuItem.find(item).price * quantity
    end
    total
  end
end
