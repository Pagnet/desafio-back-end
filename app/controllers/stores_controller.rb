# frozen_string_literal: true

class StoresController < ApplicationController
  def index
    @stores = Store.all
  end
end
