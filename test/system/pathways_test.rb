require "application_system_test_case"

class PathwaysTest < ApplicationSystemTestCase
  setup do
    @pathway = pathways(:one)
  end

  test "visiting the index" do
    visit pathways_url
    assert_selector "h1", text: "Pathways"
  end

  test "creating a Pathway" do
    visit pathways_url
    click_on "New Pathway"

    fill_in "Content", with: @pathway.content
    fill_in "Subject", with: @pathway.subject
    click_on "Create Pathway"

    assert_text "Pathway was successfully created"
    click_on "Back"
  end

  test "updating a Pathway" do
    visit pathways_url
    click_on "Edit", match: :first

    fill_in "Content", with: @pathway.content
    fill_in "Subject", with: @pathway.subject
    click_on "Update Pathway"

    assert_text "Pathway was successfully updated"
    click_on "Back"
  end

  test "destroying a Pathway" do
    visit pathways_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pathway was successfully destroyed"
  end
end
