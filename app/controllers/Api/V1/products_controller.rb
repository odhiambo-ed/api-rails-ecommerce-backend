class Api::V1::ProductsController < ApplicationController
  before_action :authenticate_customer!, except: [:index, :show]
  before_action :set_product, only: [:show, :update, :destroy]
  before_action :check_admin, only: [:create, :update, :destroy]

  def index
    @products = Product.all
    render json: @products, include: [:category, :colors, :images, :sizes]
  end

  def show
    render json: @product, include: [:category, :colors, :images, :sizes]
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      render json: @product, status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :image, :description, :original_price, :selling_price, :rating, :in_stock, :in_wishlist, :recommended, :category_id)
  end
end
