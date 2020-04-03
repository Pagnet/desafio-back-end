# frozen_string_literal: true

module Exceptions
  # Exception class when don't be passed a cnab file
  class MissingFileError < StandardError
    def initialize(message_error = custom_message_error.to_s)
      super
    end

    private

    def custom_message_error
      I18n.t('services.missing_file_error')
    end
  end
end
