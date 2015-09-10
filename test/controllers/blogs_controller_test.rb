require 'test_helper'

class BlogsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end
  
  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "should create blog" do
    post :create, blog: { title: "New Blog" }
    
    assert_equal 1, blog_repo.all.size
    assert_response :found
  end
  
  test "should fail to create blog" do
    post :create, blog: { title: "" }
    
    assert_equal 0, blog_repo.all.size
    assert_response :success
  end
  
  private
  
  def blog_repo
    @blog_repo ||= RepositoryLocator.repository_for(:blog)
  end
end
