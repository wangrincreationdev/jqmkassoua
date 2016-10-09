require 'test_helper'

class AnnouncesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @announce = announces(:one)
  end

  test "should get index" do
    get announces_url
    assert_response :success
  end

  test "should get new" do
    get new_announce_url
    assert_response :success
  end

  test "should create announce" do
    assert_difference('Announce.count') do
      post announces_url, params: { announce: { description: @announce.description, nom: @announce.nom, prix: @announce.prix } }
    end

    assert_redirected_to announce_url(Announce.last)
  end

  test "should show announce" do
    get announce_url(@announce)
    assert_response :success
  end

  test "should get edit" do
    get edit_announce_url(@announce)
    assert_response :success
  end

  test "should update announce" do
    patch announce_url(@announce), params: { announce: { description: @announce.description, nom: @announce.nom, prix: @announce.prix } }
    assert_redirected_to announce_url(@announce)
  end

  test "should destroy announce" do
    assert_difference('Announce.count', -1) do
      delete announce_url(@announce)
    end

    assert_redirected_to announces_url
  end
end
