class MenuItem < ApplicationRecord
  belongs_to :menu

  def self.selected
    MenuItem.all.where(selected: true)
  end
  def self.get_current_items
    Menu.Standard.menu_items.order(:id)
  end
end
