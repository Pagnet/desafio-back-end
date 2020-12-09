# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @stores = Store.select(:id, :name)
  end
end
