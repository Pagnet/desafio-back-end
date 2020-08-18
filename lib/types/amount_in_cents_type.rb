class AmountInCentsType < ActiveRecord::Type::Decimal
  def cast(value)
    if value.present? && !value.kind_of?(BigDecimal)
      super(BigDecimal(value.to_s).div(100, 0))
    else
      super
    end
  end

  def serialize(value)
    BigDecimal(value.to_s).mult(100, 0)
  end
end
