require 'test_helper'

class EmployeeHasShiftsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee_has_shift = employee_has_shifts(:one)
  end

  test "should get index" do
    get employee_has_shifts_url
    assert_response :success
  end

  test "should get new" do
    get new_employee_has_shift_url
    assert_response :success
  end

  test "should create employee_has_shift" do
    assert_difference('EmployeeHasShift.count') do
      post employee_has_shifts_url, params: { employee_has_shift: { employee_id: @employee_has_shift.employee_id, shift_id: @employee_has_shift.shift_id } }
    end

    assert_redirected_to employee_has_shift_url(EmployeeHasShift.last)
  end

  test "should show employee_has_shift" do
    get employee_has_shift_url(@employee_has_shift)
    assert_response :success
  end

  test "should get edit" do
    get edit_employee_has_shift_url(@employee_has_shift)
    assert_response :success
  end

  test "should update employee_has_shift" do
    patch employee_has_shift_url(@employee_has_shift), params: { employee_has_shift: { employee_id: @employee_has_shift.employee_id, shift_id: @employee_has_shift.shift_id } }
    assert_redirected_to employee_has_shift_url(@employee_has_shift)
  end

  test "should destroy employee_has_shift" do
    assert_difference('EmployeeHasShift.count', -1) do
      delete employee_has_shift_url(@employee_has_shift)
    end

    assert_redirected_to employee_has_shifts_url
  end
end
