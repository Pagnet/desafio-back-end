class Cnab::ImportCnabJob < Cnab::ApplicationJob
  def perform(import)
    import.file.open do |file|
      file.lazy.drop(0).each_slice(5) do |lines|
        lines.each do |line|
          unless line.empty?
            Transaction::ImportJob.perform_later(line.force_encoding("UTF-8").strip)
          end
        end
      end
    end
    import.finish!
  end
end
