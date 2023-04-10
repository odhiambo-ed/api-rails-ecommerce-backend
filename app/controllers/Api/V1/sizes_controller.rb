class Api::V1::SizesController < ApplicationController
  before_action :authenticate_customer!, except: [:index, :show]
  before_action :set_product, only: [:create, :index]
  before_action :set_size, only: %i[ show update destroy ]
  before_action :check_admin, only: [:create, :update, :destroy]

  # GET /sizes
  def index
    @sizes = @product.sizes.all
    render json: @sizes
  end

  # GET /sizes/1
  def show
    render json: @size
  end

  # POST /sizes
  def create
    @size = product.sizes.build(size_params)

    if @size.save
      render json: @size, status: :created, location: @size
    else
      render json: @size.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sizes/1
  def update
    if @size.update(size_params)
      render json: @size
    else
      render json: @size.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sizes/1
  def destroy
    @size.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_size
      @size = Size.find(params[:id])
    end

    def set_product
      @product = Product.find(params[:product_id])
    end

    # Only allow a list of trusted parameters through.
    def size_params
      params.require(:size).permit(:name, :description, :product_id)
    end
end
