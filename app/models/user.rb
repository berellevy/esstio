class User < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :restaurants, through: :orders


  def open_orders 
    self.orders.where("orders.status !=?", "delivered").order("orders.date desc")
  end
end
