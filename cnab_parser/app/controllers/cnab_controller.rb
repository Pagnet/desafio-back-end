# frozen_string_literal: true

class CnabController < ApplicationController
  def create
    cnab_file = params[:cnab][:file]
    file = File.read(cnab_file.tempfile)
    file_name = cnab_file.original_filename
    transactions = file.split("\n")

    index = 0
    ActiveRecord::Base.transaction do
      transactions.each do |transaction|
        index += 1

        store_name = Store.extract_name(transaction)
        store = Store.where(name: store_name).last
        store ||= Store.new(name: store_name)

        user_name = User.extract_name(transaction)
        user = User.where(name: user_name).last
        user ||= User.new(name: user_name)

        store.save!
        user.save!

        cnab = Cnab.new
        cnab.parse_cnab(transaction)
        cnab.store_id = store.id
        cnab.user_id = user.id
        cnab.file_name = file_name
        cnab.save!
      end
    end

    flash[:success] = I18n.t 'admin.upload_success'
    redirect_to home_index_url
  rescue ActiveRecord::RecordInvalid => e
    # errors = cnab.errors.full_messages
    flash[:alert] = I18n.t 'admin.upload_error', errors: e, index: index
    redirect_to home_index_url
  end
end
