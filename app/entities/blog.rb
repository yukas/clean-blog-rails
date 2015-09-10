class Blog
  attr_accessor :id, :title
  attr_reader :errors
  
  def initialize(params = { })
    params.each do |k, v|
      send("#{k}=", v)
    end
    
    @errors = { }
  end
  
  def validate
    @errors[:title] = "can't be blank" if title.nil? || title.empty?
  end
  
  def valid?
    validate
    
    errors.empty?
  end
  
  def to_h
    { id: id, title: title }
  end
end