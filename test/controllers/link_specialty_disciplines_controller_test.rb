require 'test_helper'

class LinkSpecialtyDisciplinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @link_specialty_discipline = link_specialty_disciplines(:one)
  end

  test "should get index" do
    get link_specialty_disciplines_url
    assert_response :success
  end

  test "should get new" do
    get new_link_specialty_discipline_url
    assert_response :success
  end

  test "should create link_specialty_discipline" do
    assert_difference('LinkSpecialtyDiscipline.count') do
      post link_specialty_disciplines_url, params: { link_specialty_discipline: { discipline_id: @link_specialty_discipline.discipline_id, report: @link_specialty_discipline.report, specialty_id: @link_specialty_discipline.specialty_id, term: @link_specialty_discipline.term } }
    end

    assert_redirected_to link_specialty_discipline_url(LinkSpecialtyDiscipline.last)
  end

  test "should show link_specialty_discipline" do
    get link_specialty_discipline_url(@link_specialty_discipline)
    assert_response :success
  end

  test "should get edit" do
    get edit_link_specialty_discipline_url(@link_specialty_discipline)
    assert_response :success
  end

  test "should update link_specialty_discipline" do
    patch link_specialty_discipline_url(@link_specialty_discipline), params: { link_specialty_discipline: { discipline_id: @link_specialty_discipline.discipline_id, report: @link_specialty_discipline.report, specialty_id: @link_specialty_discipline.specialty_id, term: @link_specialty_discipline.term } }
    assert_redirected_to link_specialty_discipline_url(@link_specialty_discipline)
  end

  test "should destroy link_specialty_discipline" do
    assert_difference('LinkSpecialtyDiscipline.count', -1) do
      delete link_specialty_discipline_url(@link_specialty_discipline)
    end

    assert_redirected_to link_specialty_disciplines_url
  end
end
