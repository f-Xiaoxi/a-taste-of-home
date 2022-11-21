class Meal < ApplicationRecord

  include PgSearch::Model
  pg_search_scope :search_by_name_description_seller,
    against: [ :name, :description ],
    associated_against: {
      user: [ :first_name, :last_name ]
    },
    using: {
      tsearch: { prefix: true }
    }

  belongs_to :user
  has_many :orders
  has_one_attached :photo

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
end
