class HomeController < ApplicationController
  def index
    @stores = Store.all
  end
end
