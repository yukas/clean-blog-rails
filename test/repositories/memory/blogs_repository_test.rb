require 'test_helper'

module Memory
  class BlogsRepositoryTest < ActiveSupport::TestCase
    test "it saves blog" do
      blogs_repo.save(blog)

      assert_equal blogs_repo.last, blog
    end
  
    test "assigns id to the blog" do
      blogs_repo.save(blog)
    
      assert_equal 1, blog.id
    end
    
    test "increments id on subsequent saves" do
      blogs_repo.save(blog1)
      blogs_repo.save(blog2)
      
      assert_equal 2, blog2.id
    end
    
    test "returns all entries" do
      blogs_repo.save(blog1)
      blogs_repo.save(blog2)
      
      assert_equal ({ 1 => blog1, 2 => blog2 }), blogs_repo.all
    end
    
    test "returns first entry" do
      blogs_repo.save(blog1)
      blogs_repo.save(blog2)
      
      assert_equal blog1, blogs_repo.first
    end
    
    test "returns last entry" do
      blogs_repo.save(blog1)
      blogs_repo.save(blog2)
      
      assert_equal blog2, blogs_repo.last
    end
    
    private
  
    def blog
      @blog ||= blog1
    end
    
    def blog1
      @blog1 ||= Blog.new(title: "Blog 1")
    end
  
    def blog2
      @blog2 ||= Blog.new(title: "Blog 2")
    end
  
    def blogs_repo
      @blogs_repo ||= BlogsRepository.new
    end
  end
end