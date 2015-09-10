class BlogCreator
  attr_reader :params
  attr_reader :blog, :blog_created
  
  def initialize(params)
    @params = params
    @blog_created = false
  end
  
  def create_blog
    @blog = Blog.new(params)
    
    if blog.valid?
      blog_repo.save(blog)
      @blog_created = true
    end
  end
  
  alias_method :blog_created?, :blog_created
  
  private
  
  def blog_repo
    RepositoryLocator.repository_for(:blog)
  end
end