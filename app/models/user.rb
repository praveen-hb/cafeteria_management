class User < ActiveRecord::Base
  validates :email, presence: true
  #validates :password, presence: true
  validates :first_name, presence: true
  has_secure_password
  has_many :orders

  def self.get_customers
    User.all.where(role: "customer")
  end

  def self.get_clerks
    User.all.where(role: "clerk")
  end
end
