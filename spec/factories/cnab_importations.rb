FactoryBot.define do
  factory :cnab_importation do
    status { :starting }
    file  { 
            [
              {
                "headers"=>"Content-Disposition: form-data; name=\"cnab_importation[file]\"; filename=\"CNAB.txt\"\r\nContent-Type: text/plain\r\n",
                "tempfile"=>"#<File:0x0000562b7853e720>",
                "content_type"=>"text/plain",
                "original_filename"=>"CNAB.txt"
              }
            ] 
          }
  end
end