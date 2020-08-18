config.around :example, :tz do |example|
  Time.use_zone(example.metadata[:tz]) { example.run }
end
