class Api::V1::CategoriesController < ApplicationController
   before_action :authenticate_customer!, except: [:index, :show]
   before_action :check_admin, only: [:create, :update, :destroy]

   def index
    categories = Category.all.includes(:products)
    render json: categories, include: :products
  end

  def show
    category = Category.find(params[:id])
    render json: category, include: :products
  end

  def create
    category = Category.new(category_params)
    if category.save
      render json: category, status: :created
    else
      render json: { errors: category.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    category = Category.find(params[:id])
    if category.update(category_params)
      render json: category, status: :ok
    else
      render json: { errors: category.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    head :no_content
  end

  private

  def category_params
    params.require(:category).permit(:name, :description)
  end
end
