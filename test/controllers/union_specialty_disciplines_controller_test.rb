require 'test_helper'

class UnionSpecialtyDisciplinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @union_specialty_discipline = union_specialty_disciplines(:one)
  end

  test "should get index" do
    get union_specialty_disciplines_url
    assert_response :success
  end

  test "should get new" do
    get new_union_specialty_discipline_url
    assert_response :success
  end

  test "should create union_specialty_discipline" do
    assert_difference('UnionSpecialtyDiscipline.count') do
      post union_specialty_disciplines_url, params: { union_specialty_discipline: { discipline_id: @union_specialty_discipline.discipline_id, report: @union_specialty_discipline.report, specialty_id: @union_specialty_discipline.specialty_id, term: @union_specialty_discipline.term } }
    end

    assert_redirected_to union_specialty_discipline_url(UnionSpecialtyDiscipline.last)
  end

  test "should show union_specialty_discipline" do
    get union_specialty_discipline_url(@union_specialty_discipline)
    assert_response :success
  end

  test "should get edit" do
    get edit_union_specialty_discipline_url(@union_specialty_discipline)
    assert_response :success
  end

  test "should update union_specialty_discipline" do
    patch union_specialty_discipline_url(@union_specialty_discipline), params: { union_specialty_discipline: { discipline_id: @union_specialty_discipline.discipline_id, report: @union_specialty_discipline.report, specialty_id: @union_specialty_discipline.specialty_id, term: @union_specialty_discipline.term } }
    assert_redirected_to union_specialty_discipline_url(@union_specialty_discipline)
  end

  test "should destroy union_specialty_discipline" do
    assert_difference('UnionSpecialtyDiscipline.count', -1) do
      delete union_specialty_discipline_url(@union_specialty_discipline)
    end

    assert_redirected_to union_specialty_disciplines_url
  end
end
