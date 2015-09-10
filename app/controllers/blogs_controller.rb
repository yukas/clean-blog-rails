class BlogsController < ApplicationController
  def index
  end
  
  def show
  end
  
  def new
    @blog_form = BlogForm.new(Blog.new)
  end
  
  def create
    blog_creator = BlogCreator.new(blog_params)
    blog_creator.create_blog
    
    if blog_creator.blog_created?
      redirect_to blog_path(blog_creator.blog)
    else
      @blog_form = BlogForm.new(blog_creator.blog)
      render :new
    end
  end
  
  private
  
  def blog_params
    params.require(:blog).permit(:title)
  end
end
