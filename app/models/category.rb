class Category < ApplicationRecord
  has_many :tags
  has_many :meals, through: :tags

  validates :name, presence: true, uniqueness: true
end
