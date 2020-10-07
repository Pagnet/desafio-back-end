class Cnab::ImportCnabJob < Cnab::ApplicationJob
  def perform(import)
    import.run!
    import.file.open do |file|
      file.lazy.drop(0).each_slice(5) do |lines|
        lines.each do |line|
          Transaction::Import.perform_later(line)
        end
      end
    end
    import.finish!
  end
end
