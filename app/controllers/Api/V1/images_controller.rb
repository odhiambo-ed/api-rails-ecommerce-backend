class Api::V1::ImagesController < ApplicationController
  before_action :authenticate_customer!, except: [:index, :show]
  before_action :set_product, only: [:create, :index]
  before_action :set_image, only: [:show, :update, :destroy]
  before_action :check_admin, except: [:create, :update, :destroy]

  # GET /products/:product_id/images
  def index
    @images = @product.images.all
    render json: @images
  end

  # GET /images/1
  def show
    render json: @image
  end

  # POST /products/:product_id/images
  def create
    @image = @product.images.build(image_params)

    if @image.save
      render json: @image, status: :created
    else
      render json: @image.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /images/1
  def update
    if @image.update(image_params)
      render json: @image
    else
      render json: @image.errors, status: :unprocessable_entity
    end
  end

  # DELETE /images/1
  def destroy
    @image.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_image
    @image = Image.find(params[:id])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  # Only allow a trusted parameter "white list" through.
  def image_params
    params.require(:image).permit(:name, :url)
  end
end
