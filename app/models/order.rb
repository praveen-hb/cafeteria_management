class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :user
  def self.not_delivered
    Order.all.where(delivered_at: nil)
  end

  def self.delivered
    Order.all.where(delivered_at: (not nil))
  end

  def self.not_delivered_user(id)
    Order.all.where(delivered_at: nil, user_id: id)
  end

  def self.delivered_user(id)
    Order.all.where(delivered_at: (not nil), user_id: id)
  end
end
