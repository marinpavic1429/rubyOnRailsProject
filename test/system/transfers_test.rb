require "application_system_test_case"

class TransfersTest < ApplicationSystemTestCase
  setup do
    @transfer = transfers(:one)
  end

  test "visiting the index" do
    visit transfers_url
    assert_selector "h1", text: "Transfers"
  end

  test "should create transfer" do
    visit transfers_url
    click_on "New transfer"

    fill_in "Club from", with: @transfer.club_from
    fill_in "Club to", with: @transfer.club_to
    fill_in "First name", with: @transfer.first_name
    fill_in "Last name", with: @transfer.last_name
    fill_in "Transfer fee", with: @transfer.transfer_fee
    click_on "Create Transfer"

    assert_text "Transfer was successfully created"
    click_on "Back"
  end

  test "should update Transfer" do
    visit transfer_url(@transfer)
    click_on "Edit this transfer", match: :first

    fill_in "Club from", with: @transfer.club_from
    fill_in "Club to", with: @transfer.club_to
    fill_in "First name", with: @transfer.first_name
    fill_in "Last name", with: @transfer.last_name
    fill_in "Transfer fee", with: @transfer.transfer_fee
    click_on "Update Transfer"

    assert_text "Transfer was successfully updated"
    click_on "Back"
  end

  test "should destroy Transfer" do
    visit transfer_url(@transfer)
    click_on "Destroy this transfer", match: :first

    assert_text "Transfer was successfully destroyed"
  end
end
