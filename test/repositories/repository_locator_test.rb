require 'test_helper'

class RepositoryLocatorTest < ActiveSupport::TestCase
  test "can register repository" do
    repo = Memory::BlogsRepository.new
    
    RepositoryLocator.register_repository(:blog, repo)
    
    assert_equal repo, RepositoryLocator.repository_for(:blog)
  end
end
