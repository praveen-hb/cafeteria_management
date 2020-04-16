class MenuItem < ApplicationRecord
  belongs_to :menu
  def self.selected
    MenuItem.all.where(selected: true)
  end
end
