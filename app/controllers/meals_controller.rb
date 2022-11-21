class MealsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_pending

  def index
    if params[:category].present?
      @meals = Meal.joins(:categories)
                   .where(categories: { name: params[:category] })
                   .distinct
    elsif params[:query].present?
      @meals = Meal.search_by_name_description_seller(params[:query])
    else
      @meals = Meal.all
    end
  end

  def mine
    @meals = Meal.where(user: current_user)
  end

  def show
    @meal = Meal.find(params[:id])
    @order = Order.new
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.user = current_user
    meal_params[:category_ids][1..].each do |id|
      Tag.new(meal: @meal, category: Category.find(id.to_i))
    end
    if @meal.save
      redirect_to meal_path(@meal), notice: "Meal created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def meal_params
    params.require(:meal).permit(:name, :price, :description, :photo, category_ids: [])
  end

  def set_pending
    return unless current_user

    @sales = Order.select('orders.*')
                  .joins(meal: :user)
                  .where(users: { id: current_user.id })
                  .order('id DESC')
    @pending = @sales.where(status: 'pending')
  end
end
