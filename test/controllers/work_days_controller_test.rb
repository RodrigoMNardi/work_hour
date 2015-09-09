require 'test_helper'

class WorkDaysControllerTest < ActionController::TestCase
  setup do
    @work_day = work_days(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:work_days)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create work_day" do
    assert_difference('WorkDay.count') do
      post :create, work_day: { in_hour: @work_day.in_hour, out_hour: @work_day.out_hour, weekend: @work_day.weekend }
    end

    assert_redirected_to work_day_path(assigns(:work_day))
  end

  test "should show work_day" do
    get :show, id: @work_day
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @work_day
    assert_response :success
  end

  test "should update work_day" do
    patch :update, id: @work_day, work_day: { in_hour: @work_day.in_hour, out_hour: @work_day.out_hour, weekend: @work_day.weekend }
    assert_redirected_to work_day_path(assigns(:work_day))
  end

  test "should destroy work_day" do
    assert_difference('WorkDay.count', -1) do
      delete :destroy, id: @work_day
    end

    assert_redirected_to work_days_path
  end
end
