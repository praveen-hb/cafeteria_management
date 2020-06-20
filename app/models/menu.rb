class Menu < ApplicationRecord
  has_many :menu_items
  validates :name, presence: true
  def self.Standard
    all.find { |menu| menu.Standard == true }
  end

  def self.resetID()
    @id = 0
    nil
  end

  def self.getID()
    @id += 1
    @id
  end
end
