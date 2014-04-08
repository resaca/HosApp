require 'test_helper'

class HospitalControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get _new_doctor" do
    get :_new_doctor
    assert_response :success
  end

  test "should get _new_patient" do
    get :_new_patient
    assert_response :success
  end

end
