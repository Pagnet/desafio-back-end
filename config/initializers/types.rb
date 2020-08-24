require 'types/amount_in_cents_type'
require 'types/unformatted_time_type'

ActiveRecord::Type.register(:amount_in_cents, AmountInCentsType)
ActiveRecord::Type.register(:unformatted_time, UnformattedTimeType)
