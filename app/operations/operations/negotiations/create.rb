class Operations::Negotiations::Create
  include OperationResult::Operation

  attr_reader :logger, :shopkeepers

  def initialize(logger: Rails.logger)
    @logger = logger
    @shopkeepers = []
  end

  def process(params)
    create_negotiations(params)
    result.assign(:shopkeepers, shopkeepers)
  end

  def validate(params)
    validate_for_param_keys_exists(params)
    validate_for_negotiation_kind_exists(params)
  end

  private

  def create_negotiations(params)
    params.each do |store, negotiations|
      within_transaction do
        shopkeeper = Shopkeeper.find_or_create_by(store)
        total_balance = 0
        negotiations.each do |negotiation|
          operator = negotiation_kinds(negotiation[:negotiation_kind])
          value = negotiation[:movement_value]
          negotiation[:occurrence_at] = datetime(negotiation)
          total_balance = balance(total_balance, value, operator)
          shopkeeper.negotiations.create!(atributes_for(negotiation))
        end
        shopkeeper.update(total_balance: total_balance)
        shopkeepers << shopkeeper
      end
    end
  end

  def validate_for_param_keys_exists(params)
    result.add_error(
      i18n_error_key(:invalid_negotiation)
    ) if params.blank?
  end

  def validate_for_negotiation_kind_exists(params)
    result.add_error(
      i18n_error_key(:invalid_negotiation)
    ) if params.values.flatten.pluck(:negotiation_kind).include?(nil)
  end

  def i18n_error_key(key)
    "operations.negotiations.create.errors.#{key}"
  end

  def balance(total, value, operator)
    total.send(operator, value)
  end

  def atributes_for(attr)
    attr.except(:store_representative, :store_name, :store, :hour_of_occurrence)
  end

  def datetime(negotiation)
    DateTime.parse("#{negotiation[:occurrence_at]} #{negotiation[:hour_of_occurrence]}") rescue nil
  end

  def negotiation_kinds(kind)
    {
      debit: :+,
      billet: :-,
      financing: :-,
      credit: :+,
      loan_receipt: :+,
      sales: :+,
      ted_receipt: :+,
      doc_receipt: :+,
      rent: :-
    }[kind.to_sym]
  end

  def within_transaction
    ActiveRecord::Base.transaction do
      begin
        yield
      rescue => error
        @error = error
        result.add_error(error)
        raise ActiveRecord::Rollback
      end
    end
  end
end
