# frozen_string_literal: true

class CnabParserService < ApplicationService
  attr_accessor :file
  def initialize(file)
    @file = file
  end

  def call
    clear_tables
    cnab_file = File.open(file[:file].to_s)
    cnab_file.each_line do |line|
      store_owner = line.slice(48, 14).strip
      store_name =  line.slice(62, 19).strip
      transaction_kind =  line.slice(0, 1).strip.to_i
      transaction_date =  line.slice(1, 8).strip
      transaction_amount = line.slice(9, 10).strip.to_i
      transaction_document_number = line.slice(19, 11).strip
      transaction_card_number = line.slice(30, 12).strip
      transaction_time = line.slice(42, 6).strip

      @transaction = Transaction.new(
        kind: transaction_kind.to_i,
        paid_at: DateTime.parse(transaction_date + transaction_time).in_time_zone(Time.zone),
        amount_in_cents: transaction_amount,
        document_number: transaction_document_number,
        card_number: transaction_card_number,
        store: Store.find_or_create_by(name: store_name, owner: store_owner)
      )
      @transaction.save!
    end
    :success
  end

  private

  def clear_tables
    Transaction.delete_all
    Store.delete_all
  end
end
