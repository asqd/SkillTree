require 'test_helper'

class SpecialtiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @specialty = specialties(:one)
  end

  test "should get index" do
    get specialties_url
    assert_response :success
  end

  test "should get new" do
    get new_specialty_url
    assert_response :success
  end

  test "should create specialty" do
    assert_difference('Specialty.count') do
      post specialties_url, params: { specialty: { mode: @specialty.mode, name: @specialty.name, spec_id: @specialty.spec_id, type: @specialty.type } }
    end

    assert_redirected_to specialty_url(Specialty.last)
  end

  test "should show specialty" do
    get specialty_url(@specialty)
    assert_response :success
  end

  test "should get edit" do
    get edit_specialty_url(@specialty)
    assert_response :success
  end

  test "should update specialty" do
    patch specialty_url(@specialty), params: { specialty: { mode: @specialty.mode, name: @specialty.name, spec_id: @specialty.spec_id, type: @specialty.type } }
    assert_redirected_to specialty_url(@specialty)
  end

  test "should destroy specialty" do
    assert_difference('Specialty.count', -1) do
      delete specialty_url(@specialty)
    end

    assert_redirected_to specialties_url
  end
end
