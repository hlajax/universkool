require 'test_helper'

class DiplomesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @diplome = diplomes(:one)
  end

  test "should get index" do
    get diplomes_url
    assert_response :success
  end

  test "should get new" do
    get new_diplome_url
    assert_response :success
  end

  test "should create diplome" do
    assert_difference('Diplome.count') do
      post diplomes_url, params: { diplome: { description: @diplome.description, titre: @diplome.titre } }
    end

    assert_redirected_to diplome_url(Diplome.last)
  end

  test "should show diplome" do
    get diplome_url(@diplome)
    assert_response :success
  end

  test "should get edit" do
    get edit_diplome_url(@diplome)
    assert_response :success
  end

  test "should update diplome" do
    patch diplome_url(@diplome), params: { diplome: { description: @diplome.description, titre: @diplome.titre } }
    assert_redirected_to diplome_url(@diplome)
  end

  test "should destroy diplome" do
    assert_difference('Diplome.count', -1) do
      delete diplome_url(@diplome)
    end

    assert_redirected_to diplomes_url
  end
end
