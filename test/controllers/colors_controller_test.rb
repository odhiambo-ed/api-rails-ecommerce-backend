require "test_helper"

class ColorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @color = colors(:one)
  end

  test "should get index" do
    get colors_url, as: :json
    assert_response :success
  end

  test "should create color" do
    assert_difference("Color.count") do
      post colors_url, params: { color: { name: @color.name, product_id: @color.product_id } }, as: :json
    end

    assert_response :created
  end

  test "should show color" do
    get color_url(@color), as: :json
    assert_response :success
  end

  test "should update color" do
    patch color_url(@color), params: { color: { name: @color.name, product_id: @color.product_id } }, as: :json
    assert_response :success
  end

  test "should destroy color" do
    assert_difference("Color.count", -1) do
      delete color_url(@color), as: :json
    end

    assert_response :no_content
  end
end
