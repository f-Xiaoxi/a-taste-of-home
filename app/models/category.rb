class Category < ApplicationRecord
  has_many :tags, dependent: :destroy
  has_many :meals, through: :tags

  validates :name, presence: true, uniqueness: true
end
