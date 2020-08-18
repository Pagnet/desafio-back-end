RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:deletion)
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.around(:example) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
