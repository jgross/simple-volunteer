require "test_helper"

class WeeklyPlansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @weekly_plan = weekly_plans(:one)
  end

  test "should get index" do
    get weekly_plans_url
    assert_response :success
  end

  test "should get new" do
    get new_weekly_plan_url
    assert_response :success
  end

  test "should create weekly_plan" do
    assert_difference("WeeklyPlan.count") do
      post weekly_plans_url, params: { weekly_plan: { data: @weekly_plan.data, week_number: @weekly_plan.week_number, year: @weekly_plan.year } }
    end

    assert_redirected_to weekly_plan_url(WeeklyPlan.last)
  end

  test "should show weekly_plan" do
    get weekly_plan_url(@weekly_plan)
    assert_response :success
  end

  test "should get edit" do
    get edit_weekly_plan_url(@weekly_plan)
    assert_response :success
  end

  test "should update weekly_plan" do
    patch weekly_plan_url(@weekly_plan), params: { weekly_plan: { data: @weekly_plan.data, week_number: @weekly_plan.week_number, year: @weekly_plan.year } }
    assert_redirected_to weekly_plan_url(@weekly_plan)
  end

  test "should destroy weekly_plan" do
    assert_difference("WeeklyPlan.count", -1) do
      delete weekly_plan_url(@weekly_plan)
    end

    assert_redirected_to weekly_plans_url
  end
end
