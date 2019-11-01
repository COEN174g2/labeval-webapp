require "application_system_test_case"

class QsTest < ApplicationSystemTestCase
  setup do
    @q = qs(:one)
  end

  test "visiting the index" do
    visit qs_url
    assert_selector "h1", text: "Qs"
  end

  test "creating a Q" do
    visit qs_url
    click_on "New Q"

    fill_in "Questionnaire", with: @q.questionnaire_id
    fill_in "Student", with: @q.student_id
    click_on "Create Q"

    assert_text "Q was successfully created"
    click_on "Back"
  end

  test "updating a Q" do
    visit qs_url
    click_on "Edit", match: :first

    fill_in "Questionnaire", with: @q.questionnaire_id
    fill_in "Student", with: @q.student_id
    click_on "Update Q"

    assert_text "Q was successfully updated"
    click_on "Back"
  end

  test "destroying a Q" do
    visit qs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Q was successfully destroyed"
  end
end
