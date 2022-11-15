class User < ApplicationRecord
  has_many :meals, dependent: :destroy
  has_many :bought_orders, foreign_key: 'buyer_id', class_name: 'Order'
  has_many :sold_orders, through: :meals, source: :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
