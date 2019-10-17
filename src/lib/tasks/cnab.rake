namespace :cnab do

  task read_file: :environment do

    file = Rails.root.join('cnab.txt').to_s

    File.open(file, 'r').each do |line|
      data = CnabAdapter.adapt(line)
      puts data
    end

  end

end