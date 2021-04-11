module UseCase
  class Base
    attr_reader :repository

    def initialize(repo)
      @repository = repo
    end
  end
end
