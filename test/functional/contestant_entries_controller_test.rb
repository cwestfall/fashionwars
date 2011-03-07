require 'test_helper'

class ContestantEntriesControllerTest < ActionController::TestCase
  setup do
    @contestant_entry = contestant_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contestant_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contestant_entry" do
    assert_difference('ContestantEntry.count') do
      post :create, :contestant_entry => @contestant_entry.attributes
    end

    assert_redirected_to contestant_entry_path(assigns(:contestant_entry))
  end

  test "should show contestant_entry" do
    get :show, :id => @contestant_entry.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @contestant_entry.to_param
    assert_response :success
  end

  test "should update contestant_entry" do
    put :update, :id => @contestant_entry.to_param, :contestant_entry => @contestant_entry.attributes
    assert_redirected_to contestant_entry_path(assigns(:contestant_entry))
  end

  test "should destroy contestant_entry" do
    assert_difference('ContestantEntry.count', -1) do
      delete :destroy, :id => @contestant_entry.to_param
    end

    assert_redirected_to contestant_entries_path
  end
end
