class ApplicationController < ActionController::Base

  private

  def set_flash_message(key, message, options = {})
    if options[:now]
      flash.now[key] = message if message.present?
    else
      flash[key] = message if message.present?
    end
  end
end
