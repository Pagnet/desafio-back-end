class CNAB::Parser
  class Line
    POSITIONS = {
      type_num:            (0..0),
      occurrence_date:     (1..8),
      value:               (9..18),
      cpf:                 (19..29),
      credit_card_number:  (30..41),
      occurrence_time:     (42..47),
      store_owner_name:    (48..61),
      store_name:          (62..80)
    }.freeze

    def initialize(line)
      @line = line
    end

    def parse
      {
        type_num:            type_num,
        occurrence_datetime: occurrence_datetime,
        value:               value,
        cpf:                 cpf,
        credit_card_number:  credit_card_number,
        store_owner_name:    store_owner_name,
        store_name:          store_name
      }
    end

    private

    def type_num
      @line.slice(POSITIONS[:type_num])
    end

    def store_name
      @line.slice(POSITIONS[:store_name]).strip
    end

    def store_owner_name
      @line.slice(POSITIONS[:store_owner_name]).strip
    end

    def occurrence_datetime
      Time.zone.strptime(
        @line.slice(POSITIONS[:occurrence_date]) + @line.slice(POSITIONS[:occurrence_time]),
        '%Y%m%d%H%M%S'
      )
    end

    def cpf
      @line.slice(POSITIONS[:cpf])
    end

    def value
      @line.slice(POSITIONS[:value]).to_i / 100.0
    end

    def credit_card_number
      @line.slice(POSITIONS[:credit_card_number])
    end
  end

  attr_reader :file_content

  def initialize(file_content)
    @file_content = file_content
  end

  def call
    file_content.split("\n").map do |line|
      Line.new(line).parse
    end
  end
end
