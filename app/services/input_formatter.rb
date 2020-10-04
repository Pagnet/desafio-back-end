class InputFormatter
  def initialize(string)
    @string = string
  end

  def extract_infos
    @string = @string.split('')
    transaction_type = @string.shift.to_i
    date = @string.slice!(0, 8)
    value = @string.slice!(0, 10)
    cpf = @string.slice!(0, 11)
    credit_card = @string.slice!(0, 12).join('')
    time = @string.slice!(0, 6)
    owner = @string.slice!(0, 14).join('').lstrip
    company = @string.slice!(0, 19).join('').lstrip
    {
      transaction_type: transaction_type,
      date: date_formatter(date),
      value: value_formatter(value, transaction_type),
      cpf: cpf_formatter(cpf),
      credit_card: credit_card,
      time: time_formatter(time),
      owner: owner,
      company: company
    }
  end

  private

  def date_formatter(array)
    array = array[6..7] + ['/'] + array[4..5] + ['/'] + array[0..3]
    array.join('')
  end

  def value_formatter(array, type)
    array = array.join('').to_f / 100
    return array * -1 if [2, 3, 9].include?(type)

    array
  end

  def cpf_formatter(array)
    array = array[0...3] + ['.'] + array[3...6] + ['.'] + array[6...9] + ['-'] + array[9...11]
    array.join('')
  end

  def time_formatter(array)
    array = array[0...2] + [':'] + array[2...4] + [':'] + array[4...6]
    array.join('')
  end
end
