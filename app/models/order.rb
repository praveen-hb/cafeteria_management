class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :user
  def self.not_delivered
    Order.all.where(delivered_at: nil)
  end
end
