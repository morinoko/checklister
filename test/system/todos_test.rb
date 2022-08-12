require "application_system_test_case"

class TodosTest < ApplicationSystemTestCase
  setup do
    @todo = todos(:first)
  end

  test "Creating a new todo item" do
    visit todos_path
    assert_selector 'h1', text: "Checklist"

    click_on "New Todo"
    assert_selector 'h1', text: "New Todo"

    fill_in "Summary", with: "Go shopping"
    click_on "Create Todo"

    assert_selector 'h1', text: 'Checklist'
    assert_text 'Go shopping'
  end

  test "Showing a todo item" do
    visit todos_path
    click_link @todo.summary

    assert_selector "h1", text: @todo.summary
  end

  test "Updating a todo" do
    visit todos_path
    assert_selector 'h1', text: "Checklist"

    click_on "Edit", match: :first
    assert_selector "h1", text: "Edit Todo"

    fill_in "Summary", with: "Updated todo"
    click_on "Update Todo"

    assert_selector 'h1', text: 'Checklist'
    assert_text 'Updated todo'
  end

  test "Destroying a todo" do
    visit todos_path
    assert_text @todo.summary

    click_on "Delete", match: :first
    assert_no_text @todo.summary
  end
end
