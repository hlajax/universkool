require "application_system_test_case"

class DemandesTest < ApplicationSystemTestCase
  setup do
    @demande = demandes(:one)
  end

  test "visiting the index" do
    visit demandes_url
    assert_selector "h1", text: "Demandes"
  end

  test "creating a Demande" do
    visit demandes_url
    click_on "New Demande"

    fill_in "Contenu", with: @demande.contenu
    fill_in "Email", with: @demande.email
    fill_in "Nom", with: @demande.nom
    fill_in "Objet", with: @demande.objet
    fill_in "Telephone", with: @demande.telephone
    click_on "Create Demande"

    assert_text "Demande was successfully created"
    click_on "Back"
  end

  test "updating a Demande" do
    visit demandes_url
    click_on "Edit", match: :first

    fill_in "Contenu", with: @demande.contenu
    fill_in "Email", with: @demande.email
    fill_in "Nom", with: @demande.nom
    fill_in "Objet", with: @demande.objet
    fill_in "Telephone", with: @demande.telephone
    click_on "Update Demande"

    assert_text "Demande was successfully updated"
    click_on "Back"
  end

  test "destroying a Demande" do
    visit demandes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Demande was successfully destroyed"
  end
end
