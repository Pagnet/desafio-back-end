namespace :cnab do

  task process_file: :environment do

    file = Rails.root.join('cnab.txt').to_s

    File.open(file, 'r').each do |line|
      ImportTransactionJob.perform_now(line)
    end

  end

end