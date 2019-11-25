require "application_system_test_case"

class DiplomesTest < ApplicationSystemTestCase
  setup do
    @diplome = diplomes(:one)
  end

  test "visiting the index" do
    visit diplomes_url
    assert_selector "h1", text: "Diplomes"
  end

  test "creating a Diplome" do
    visit diplomes_url
    click_on "New Diplome"

    fill_in "Description", with: @diplome.description
    fill_in "Titre", with: @diplome.titre
    click_on "Create Diplome"

    assert_text "Diplome was successfully created"
    click_on "Back"
  end

  test "updating a Diplome" do
    visit diplomes_url
    click_on "Edit", match: :first

    fill_in "Description", with: @diplome.description
    fill_in "Titre", with: @diplome.titre
    click_on "Update Diplome"

    assert_text "Diplome was successfully updated"
    click_on "Back"
  end

  test "destroying a Diplome" do
    visit diplomes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Diplome was successfully destroyed"
  end
end
