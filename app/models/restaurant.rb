class Restaurant < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :users, through: :orders
  has_many :items

  def self.top_rated(quantity = 5)
    self.all.order(rating: :desc).limit(quantity)
  end

  
end
