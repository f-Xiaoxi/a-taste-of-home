class OrdersController < ApplicationController
  def index
    # @bought_orders = Order.where(buyer: current_user)
    @purchases = current_user.purchases
    @sales = Order.select('orders.*')
                  .joins(meal: :user)
                  .where(users: { id: current_user.id })
  end

  def create
    meal = Meal.find(params[:meal_id])
    order = Order.new(buyer: current_user, meal: meal, status: 'pending')
    order.save
    # if @order.save
    #   completed = true
    # end
  end

  def update
  end
end
