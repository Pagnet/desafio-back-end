# frozen_string_literal: true

# Abstract controller
class ApplicationController < ActionController::Base
  around_action :handle_exception

  def handle_exception
    yield
  rescue StandardError => e
    redirect_back fallback_location: root_path
    flash[:alert] = e.message
  end
end
