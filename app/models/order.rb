class Order < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items
  accepts_nested_attributes_for :items
  # validates :date, presence: true

  def total_price
    items.sum(&:price)
  end
  
  def restaurant_name 
    self.restaurant.name
  end
  
end
