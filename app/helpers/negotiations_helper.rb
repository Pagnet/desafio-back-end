module NegotiationsHelper
  def occurrence_at(datetime)
    DateTime.parse(datetime).try(:strftime, '%d/%m/%Y %H:%M:%S') rescue nil
  end
end
