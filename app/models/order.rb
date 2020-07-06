class Order < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items
  accepts_nested_attributes_for :items

  def total_price
    items.sum(&:price)
  end
  
  
end
