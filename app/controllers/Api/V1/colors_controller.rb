class Api::V1::ColorsController < ApplicationController
  before_action :authenticate_customer!, except: [:index, :show]
  before_action :set_color, only: %i[ show update destroy ]
  before_action :set_product, only: [:create, :index]
  before_action :check_admin, only: [:create, :update, :destroy]

  # GET /colors
  def index
    @colors = @product.colors.all

    render json: @colors
  end

  # GET /colors/1
  def show
    render json: @color
  end

  # POST /colors
  def create
    @color = @product.colors.build(color_params)

    if @color.save
      render json: @color, status: :created, location: @color
    else
      render json: @color.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /colors/1
  def update
    if @color.update(color_params)
      render json: @color
    else
      render json: @color.errors, status: :unprocessable_entity
    end
  end

  # DELETE /colors/1
  def destroy
    @color.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_color
      @color = Color.find(params[:id])
    end

    def set_product
      @product = Product.find(params[:product_id])
    end

    # Only allow a list of trusted parameters through.
    def color_params
      params.require(:color).permit(:name, :product_id)
    end
end
