class OrdersController < ApplicationController
  def index
    # @bought_orders = Order.where(buyer: current_user)
    # @sold_orders = Order.select('orders.*')
    #                     .joins(meal: :user)
    #                     .where(users: { id: current_user.id })
    @bought_orders = current_user.bought_orders
    @sold_orders = current_user.sold_orders
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
