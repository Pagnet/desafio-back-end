json.extract! financial_entry, :id, :kind, :transaction_date, :transaction_time, :amount, :social_number, :card_number, :store_id, :created_at, :updated_at
json.url financial_entry_url(financial_entry, format: :json)
