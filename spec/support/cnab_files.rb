module CnabFiles
  def valid_cnab_file
    file = File.open('tmp/cnab.txt', 'w')
    file.puts('3201903010000014200096206760174753****3153153453JOÃO MACEDO   BAR DO JOÃO       ')
    file.close

    ActionDispatch::Http::UploadedFile.new(tempfile: file)
  end

  def invalid_line_cnab_file
    file = File.open('tmp/cnab.txt', 'w')
    file.puts('****3153153453JOÃO MACEDO   BAR DO JOÃO        ')
    file.close

    ActionDispatch::Http::UploadedFile.new(tempfile: file)
  end
end