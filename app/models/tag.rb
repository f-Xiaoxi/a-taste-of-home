class Tag < ApplicationRecord
  belongs_to :category
  belongs_to :meal

  validates :meal, uniqueness: { scope: :category }
end
