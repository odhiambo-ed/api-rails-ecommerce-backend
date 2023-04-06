require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get products_url, as: :json
    assert_response :success
  end

  test "should create product" do
    assert_difference("Product.count") do
      post products_url, params: { product: { category: @product.category, description: @product.description, image: @product.image, in_stock: @product.in_stock, name: @product.name, original_price: @product.original_price, rating: @product.rating, selling_price: @product.selling_price } }, as: :json
    end

    assert_response :created
  end

  test "should show product" do
    get product_url(@product), as: :json
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: { category: @product.category, description: @product.description, image: @product.image, in_stock: @product.in_stock, name: @product.name, original_price: @product.original_price, rating: @product.rating, selling_price: @product.selling_price } }, as: :json
    assert_response :success
  end

  test "should destroy product" do
    assert_difference("Product.count", -1) do
      delete product_url(@product), as: :json
    end

    assert_response :no_content
  end
end
