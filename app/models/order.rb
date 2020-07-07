class Order < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items
  accepts_nested_attributes_for :items
  before_create :set_initial_status, :set_initial_date 
  validates :items, presence: true


  def total_price
    items.sum(&:price)
  end
  
  def restaurant_name 
    self.restaurant.name
  end
  
  private

  def set_initial_status
    self.status = "recieved"
  end

  def set_initial_date 
    self.date = self.updated_at
  end
end
