require 'test_helper'

class DirectoryHomeworksControllerTest < ActionController::TestCase
  setup do
    @directory_homework = directory_homeworks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:directory_homeworks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create directory_homework" do
    assert_difference('DirectoryHomework.count') do
      post :create, directory_homework: { class_name: @directory_homework.class_name, directory_class_id: @directory_homework.directory_class_id }
    end

    assert_redirected_to directory_homework_path(assigns(:directory_homework))
  end

  test "should show directory_homework" do
    get :show, id: @directory_homework
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @directory_homework
    assert_response :success
  end

  test "should update directory_homework" do
    patch :update, id: @directory_homework, directory_homework: { class_name: @directory_homework.class_name, directory_class_id: @directory_homework.directory_class_id }
    assert_redirected_to directory_homework_path(assigns(:directory_homework))
  end

  test "should destroy directory_homework" do
    assert_difference('DirectoryHomework.count', -1) do
      delete :destroy, id: @directory_homework
    end

    assert_redirected_to directory_homeworks_path
  end
end
