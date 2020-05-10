class Menu < ApplicationRecord
  has_many :menu_items
  validates :name, presence: true
  def self.Standard
    all.find { |menu| menu.Standard == true }
  end
end
