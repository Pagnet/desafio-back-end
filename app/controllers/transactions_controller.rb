# frozen_string_literal: true

class TransactionsController < ApplicationController
  def index
    @stores = Store.all
  end
end
