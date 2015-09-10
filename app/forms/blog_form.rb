class BlogForm
  include ActiveModel::Conversion
  extend Forwardable
  
  def_delegators :blog, :id, :title, :errors

  attr_reader :blog
  
  def initialize(blog)
    @blog = blog
  end
  
  def persisted?
    id
  end
  
  def model_name
    ActiveModel::Name.new(Blog)
  end
end