module FileStorage
  class LocalStorage
    def initialize(root_folder = Rails.root.join('public/storage/'))
      @root_folder = root_folder
    end

    def exists?(file_path)
      File.exists?(build_full_file_path(file_path))
    end

    def signed_url(file_path)
      if (file_path[0] != '/')
        file_path = "/#{@root_folder}/#{file_path}"
      end

      public_url = file_path.gsub(/^.+?(public\/)/, '/')
    end

    def read!(file_path)
      StringIO.new(File.read(build_full_file_path(file_path)))
    end

    def write!(file_path, stream, options = {})
      full_file_path = build_full_file_path(file_path)

      FileUtils.mkdir_p(File.dirname(full_file_path))
      File.write(full_file_path, stream)
    end

    private

    def build_full_file_path(file_path)
      @root_folder.join(file_path).to_s
    end
  end
end
