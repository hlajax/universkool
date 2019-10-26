require "application_system_test_case"

class EtablissementsTest < ApplicationSystemTestCase
  setup do
    @etablissement = etablissements(:one)
  end

  test "visiting the index" do
    visit etablissements_url
    assert_selector "h1", text: "Etablissements"
  end

  test "creating a Etablissement" do
    visit etablissements_url
    click_on "New Etablissement"

    fill_in "Adresse", with: @etablissement.adresse
    fill_in "Category", with: @etablissement.category_id
    fill_in "Country", with: @etablissement.country_id
    fill_in "Cover", with: @etablissement.cover
    fill_in "Description", with: @etablissement.description
    fill_in "Email", with: @etablissement.email
    fill_in "Nom", with: @etablissement.nom
    fill_in "Profil", with: @etablissement.profil
    fill_in "Site", with: @etablissement.site
    fill_in "Slug", with: @etablissement.slug
    fill_in "Telephone", with: @etablissement.telephone
    click_on "Create Etablissement"

    assert_text "Etablissement was successfully created"
    click_on "Back"
  end

  test "updating a Etablissement" do
    visit etablissements_url
    click_on "Edit", match: :first

    fill_in "Adresse", with: @etablissement.adresse
    fill_in "Category", with: @etablissement.category_id
    fill_in "Country", with: @etablissement.country_id
    fill_in "Cover", with: @etablissement.cover
    fill_in "Description", with: @etablissement.description
    fill_in "Email", with: @etablissement.email
    fill_in "Nom", with: @etablissement.nom
    fill_in "Profil", with: @etablissement.profil
    fill_in "Site", with: @etablissement.site
    fill_in "Slug", with: @etablissement.slug
    fill_in "Telephone", with: @etablissement.telephone
    click_on "Update Etablissement"

    assert_text "Etablissement was successfully updated"
    click_on "Back"
  end

  test "destroying a Etablissement" do
    visit etablissements_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Etablissement was successfully destroyed"
  end
end
