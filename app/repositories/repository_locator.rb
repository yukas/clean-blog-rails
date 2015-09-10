class RepositoryLocator
  class << self
    def repository_for(type)
      repositories[type]
    end
  
    def register_repository(type, repo)
      repositories[type] = repo
    end
  
    private
    
    def repositories
      @repositories ||= { }
    end
  end
end

RepositoryLocator.register_repository(:blog, Memory::BlogsRepository.new)