class User < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :restaurants, through: :orders
  validates :name, :username, :phone_number,  presence: true
  validates :username, uniqueness: { case_sensitive: false }
  validates :address, presence: {message: "missing. How do you expect restaurants to know where to deliver to??"}
  validates :phone_number, numericality:{only_integer: true}, length: {is: 10}
  
  
  
  


  has_secure_password

  def open_orders 
    self.orders.where("orders.status !=?", "delivered").order("orders.date desc")
  end

 
end
