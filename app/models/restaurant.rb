class Restaurant < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :users, through: :orders
  has_many :items
  has_secure_password
  
  
  def open_orders 
    self.orders.where("orders.status !=?", "delivered").order("orders.date desc")
  end
  

  

  #  CLASS METHODS  #
  def self.top_rated(quantity = 5)
    self.all.order(rating: :desc).limit(quantity)
  end


end
