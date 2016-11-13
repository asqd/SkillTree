require 'test_helper'

class AssignmentSpecialtyDisciplinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @assignment_specialty_discipline = assignment_specialty_disciplines(:one)
  end

  test "should get index" do
    get assignment_specialty_disciplines_url
    assert_response :success
  end

  test "should get new" do
    get new_assignment_specialty_discipline_url
    assert_response :success
  end

  test "should create assignment_specialty_discipline" do
    assert_difference('AssignmentSpecialtyDiscipline.count') do
      post assignment_specialty_disciplines_url, params: { assignment_specialty_discipline: { discipline_id: @assignment_specialty_discipline.discipline_id, report: @assignment_specialty_discipline.report, specialty_id: @assignment_specialty_discipline.specialty_id, term: @assignment_specialty_discipline.term } }
    end

    assert_redirected_to assignment_specialty_discipline_url(AssignmentSpecialtyDiscipline.last)
  end

  test "should show assignment_specialty_discipline" do
    get assignment_specialty_discipline_url(@assignment_specialty_discipline)
    assert_response :success
  end

  test "should get edit" do
    get edit_assignment_specialty_discipline_url(@assignment_specialty_discipline)
    assert_response :success
  end

  test "should update assignment_specialty_discipline" do
    patch assignment_specialty_discipline_url(@assignment_specialty_discipline), params: { assignment_specialty_discipline: { discipline_id: @assignment_specialty_discipline.discipline_id, report: @assignment_specialty_discipline.report, specialty_id: @assignment_specialty_discipline.specialty_id, term: @assignment_specialty_discipline.term } }
    assert_redirected_to assignment_specialty_discipline_url(@assignment_specialty_discipline)
  end

  test "should destroy assignment_specialty_discipline" do
    assert_difference('AssignmentSpecialtyDiscipline.count', -1) do
      delete assignment_specialty_discipline_url(@assignment_specialty_discipline)
    end

    assert_redirected_to assignment_specialty_disciplines_url
  end
end
