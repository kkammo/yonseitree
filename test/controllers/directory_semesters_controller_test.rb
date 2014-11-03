require 'test_helper'

class DirectorySemestersControllerTest < ActionController::TestCase
  setup do
    @directory_semester = directory_semesters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:directory_semesters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create directory_semester" do
    assert_difference('DirectorySemester.count') do
      post :create, directory_semester: { semester_name: @directory_semester.semester_name }
    end

    assert_redirected_to directory_semester_path(assigns(:directory_semester))
  end

  test "should show directory_semester" do
    get :show, id: @directory_semester
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @directory_semester
    assert_response :success
  end

  test "should update directory_semester" do
    patch :update, id: @directory_semester, directory_semester: { semester_name: @directory_semester.semester_name }
    assert_redirected_to directory_semester_path(assigns(:directory_semester))
  end

  test "should destroy directory_semester" do
    assert_difference('DirectorySemester.count', -1) do
      delete :destroy, id: @directory_semester
    end

    assert_redirected_to directory_semesters_path
  end
end
