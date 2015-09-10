require 'test_helper'

class BlogTest < ActiveSupport::TestCase
  test "validate invalid blog" do
    blog = Blog.new(title: "")
    blog.validate
    
    assert_equal false, blog.valid?
  end
  
  test "validate valid blog" do
    blog = Blog.new(title: "Hi")
    blog.validate
    
    assert_equal true, blog.valid?
  end
  
  test "to_h" do
    blog = Blog.new(id: 1, title: "hello")
    
    assert_equal ({ id: 1, title: "hello" }), blog.to_h
  end
end
