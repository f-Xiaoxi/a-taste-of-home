class Order < ApplicationRecord
  belongs_to :buyer, class_name: 'User', foreign_key: 'user_id'
  belongs_to :meal

  validates :status, inclusion: { in: %w[pending accepted rejected completed] }, presence: true
  scope :sales_for, ->(user) { joins(:meal).where( user_id: user.id ) }
end
