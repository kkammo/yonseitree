require 'test_helper'

class DirectoryClassesControllerTest < ActionController::TestCase
  setup do
    @directory_class = directory_classes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:directory_classes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create directory_class" do
    assert_difference('DirectoryClass.count') do
      post :create, directory_class: { class_name: @directory_class.class_name, directory_semester_id: @directory_class.directory_semester_id }
    end

    assert_redirected_to directory_class_path(assigns(:directory_class))
  end

  test "should show directory_class" do
    get :show, id: @directory_class
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @directory_class
    assert_response :success
  end

  test "should update directory_class" do
    patch :update, id: @directory_class, directory_class: { class_name: @directory_class.class_name, directory_semester_id: @directory_class.directory_semester_id }
    assert_redirected_to directory_class_path(assigns(:directory_class))
  end

  test "should destroy directory_class" do
    assert_difference('DirectoryClass.count', -1) do
      delete :destroy, id: @directory_class
    end

    assert_redirected_to directory_classes_path
  end
end
