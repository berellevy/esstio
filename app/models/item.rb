class Item < ApplicationRecord
  belongs_to :restaurant
  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items
end
