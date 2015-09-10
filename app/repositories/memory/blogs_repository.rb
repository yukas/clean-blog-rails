module Memory
  class BlogsRepository
    def initialize
      @blogs = { }
      @next_id = 1
    end
    
    def save(blog)
      blog.id = next_id
      blogs[next_id] = blog
      @next_id += 1
      
      blog
    end
    
    def all
      blogs
    end
    
    def first
      first_key = blogs.keys.sort.first
      blogs[first_key]
    end
    
    def last
      last_key = blogs.keys.sort.last
      blogs[last_key]
    end
    
    private
    attr_reader :blogs, :next_id
  end
end
