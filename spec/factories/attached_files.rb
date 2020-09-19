FactoryBot.define do
  factory :attached_file do
    filename { "#{SecureRandom.uuid}.txt" }
    kind { AttachedFile::KINDS.sample }
    processed_at { Time.current }
    filepath { "#{Rails.root}/spec/file_storage/attached_files/CNAB.txt" }
  end
end