class Menu < ApplicationRecord
  has_many :menu_items
  def self.Standard
    all.find { |menu| menu.Standard == true }
  end
end
