class MenuItem < ApplicationRecord
  belongs_to :menu
  def self.selected_ones
    all.where(selected: true)
  end
end
