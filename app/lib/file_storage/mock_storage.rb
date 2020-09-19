module FileStorage
  class MockStorage
    def initialize
      @files = {}
    end

    def exists?(file_path)
      @files.has_key?(file_path)
    end

    def signed_url(file_path)
      "http://fake.s3.com.br/#{file_path}"
    end

    def read!(file_path)
      if file = @files[file_path]
        StringIO.new(file)
      end
    end

    def write!(file_path, stream, options = {})
      @files[file_path] = stream
    end
  end
end
