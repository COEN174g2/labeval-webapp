require 'test_helper'

class QsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @q = qs(:one)
  end

  test "should get index" do
    get qs_url
    assert_response :success
  end

  test "should get new" do
    get new_q_url
    assert_response :success
  end

  test "should create q" do
    assert_difference('Q.count') do
      post qs_url, params: { q: { questionnaire_id: @q.questionnaire_id, student_id: @q.student_id } }
    end

    assert_redirected_to q_url(Q.last)
  end

  test "should show q" do
    get q_url(@q)
    assert_response :success
  end

  test "should get edit" do
    get edit_q_url(@q)
    assert_response :success
  end

  test "should update q" do
    patch q_url(@q), params: { q: { questionnaire_id: @q.questionnaire_id, student_id: @q.student_id } }
    assert_redirected_to q_url(@q)
  end

  test "should destroy q" do
    assert_difference('Q.count', -1) do
      delete q_url(@q)
    end

    assert_redirected_to qs_url
  end
end
