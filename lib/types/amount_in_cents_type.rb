class AmountInCentsType < ActiveRecord::Type::Decimal
  def cast(input)
    if input.present? && !input.kind_of?(BigDecimal)
      super(BigDecimal(input.to_s).div(100, 0))
    else
      super
    end
  end

  def serialize(output)
    BigDecimal(output.to_s).mult(100, 0)
  end
end
