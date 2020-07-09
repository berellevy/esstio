class Item < ApplicationRecord
  belongs_to :restaurant
  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items

  validates :name, :description, :price, presence: true
  validates :price, numericality: {greater_than: 0}
  # validates_uniqueness_of name: {scope: :restaurant}
end
