class Meal < ApplicationRecord
  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
  has_many :orders

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
end
