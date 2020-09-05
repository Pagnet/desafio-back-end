# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

operation_types = [
  { code: :debit,     nature: :input},
  { code: :bank_slip, nature: :output},
  { code: :financing, nature: :output},
  { code: :credit,    nature: :input},
  { code: :loan,      nature: :input},
  { code: :sales,     nature: :input},
  { code: :ted,       nature: :input},
  { code: :doc,       nature: :input},
  { code: :rent,      nature: :output},
]

operation_types.each do |data|
  OperationType.find_or_create_by(data)
end
