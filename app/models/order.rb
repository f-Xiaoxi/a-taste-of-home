class Order < ApplicationRecord
  belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'
  belongs_to :meal

  has_one :user, through: :meal

  validates :status, inclusion: { in: %w[pending accepted rejected completed] }, presence: true
end