# frozen_string_literal: true

class StoreController < ApplicationController
  def show
    @summary = Store.where(id: params[:id]).joins(:cnabs).group('name').sum('value').first
    @transactions = Cnab.joins(:user).joins(:store).where(store_id: params[:id])
  end
end
