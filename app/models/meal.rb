class Meal < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_many :tags
  has_many :categories, through: :tags
  has_one_attached :photo

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
end
