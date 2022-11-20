class OrdersController < ApplicationController
  def index
    # @bought_orders = Order.where(buyer: current_user)
    @purchases = current_user.purchases.order('id DESC')
    @sales = Order.select('orders.*')
                  .joins(meal: :user)
                  .where(users: { id: current_user.id })
                  .order('id DESC')
  end

  def create
    meal = Meal.find(params[:meal_id])
    order = Order.new(buyer: current_user, meal: meal, status: 'pending')
    if order.save
      redirect_to meal_path(meal), notice: "Order created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    order = Order.find(params[:id])
    order.update!(order_params)
    redirect_to orders_path, notice: "Order updated"
  end

  private

  def order_params
    params.require(:order).permit(:status, :comment)
  end
end
