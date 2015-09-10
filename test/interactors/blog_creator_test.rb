require 'test_helper'

class BlogCreatorTest < ActiveSupport::TestCase
  test "creates valid blog" do
    blog_creator = BlogCreator.new(title: "Pushkin's blog")
    blog_creator.create_blog
    
    assert_equal 1, blog_repo.all.size
  end
  
  test "doesn't create invalid blog" do
    blog_creator = BlogCreator.new(title: "")
    blog_creator.create_blog
    
    assert_equal 0, blog_repo.all.size
  end
  
  private
  
  def blog_repo
    @blog_repo ||= RepositoryLocator.repository_for(:blog)
  end
end
