class User < ApplicationRecord
  has_many :meals, dependent: :destroy
  # has_many :sold_orders, through: :meals, foreign_key: 'seller_id'

  has_many :purchases, class_name: 'Order'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def sales
    Order.joins(:meal).where(user_id: self.id)
  end
end
