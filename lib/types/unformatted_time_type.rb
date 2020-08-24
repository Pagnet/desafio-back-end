class UnformattedTimeType < ActiveRecord::Type::Time
  def cast(input)
    if input.present? && !input.try(:acts_like_time?)
      str = input.to_s

      unless str =~ /.{2}\:.{2}\:.{2}/
        str = str.scan(/.{2}/).join(':')
      end

      Time.zone.strptime(str, '%H:%M:%S')
    else
      super
    end
  end

  def serialize(output)
    output.strftime('%H:%M:%S').gsub(':', '')
  end
end
