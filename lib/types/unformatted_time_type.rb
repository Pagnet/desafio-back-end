class UnformattedTimeType < ActiveRecord::Type::Time
  def cast(value)
    # byebug
    if value.present? && !(value.kind_of?(Time) || value.kind_of?(ActiveSupport::TimeWithZone) || value.kind_of?(DateTime))
      unless value =~ /.{2}\:.{2}\:.{2}/
        value = value.scan(/.{2}/).join(':')
      end

      Time.zone.strptime(value, '%H:%M:%S')
    else
      super
    end
  end

  def serialize(value)
    value.strftime('%H:%M:%S').gsub(':', '')
  end
end
