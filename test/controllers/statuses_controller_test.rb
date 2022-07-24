require "test_helper"

class StatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @status = statuses(:one)
  end

  test "should get index" do
    get statuses_url, as: :json
    assert_response :success
  end

  test "should create status" do
    assert_difference("Status.count") do
      post statuses_url, params: { status: { property_id: @status.property_id, status_type: @status.status_type, user_id: @status.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show status" do
    get status_url(@status), as: :json
    assert_response :success
  end

  test "should update status" do
    patch status_url(@status), params: { status: { property_id: @status.property_id, status_type: @status.status_type, user_id: @status.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy status" do
    assert_difference("Status.count", -1) do
      delete status_url(@status), as: :json
    end

    assert_response :no_content
  end
end
