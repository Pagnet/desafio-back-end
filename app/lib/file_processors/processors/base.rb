
module FileProcessors
  module Processors
    class Base
      attr_reader :result, :attached_file, :logger
      def initialize(attached_file, logger: Rails.logger)
        @attached_file = attached_file
        @result = OperationResult::Result.new
        @logger = logger
      end

      def process
        raise NotImplementedError
      end

      def call
        return unless %w(pending error).include?(attached_file.status)
        begin
          raise 'no file' unless  attached_file.present?

          attached_file.update(status: 'processing')

          self.process
        rescue StandardError => e
          logger.error("Something went wrong processing #{attached_file.id}. #{e.message} - #{e.backtrace}")
          add_error(:something_wrong)
        end

        if result.success?
          attached_file.update(
            status: attached_file.metadata['could_not_parse'].blank? ? 'processed' : 'partial',
            processed_at: Time.current
          )
        else
          attached_file.processed_at = Time.current
          attached_file.status = 'error'
          attached_file.metadata['errors'] = result.errors
          attached_file.save
        end

        result
      end

      private

      def add_error(error_key, error_args = {})
        result.add_error(
          build_i18n_error_key(error_key),
          error_args
        )
      end

      def build_i18n_error_key(error_key)
        i18n_scope = self.class.name.underscore.downcase.split('/')
        i18n_scope << 'errors'
        i18n_scope << error_key
        i18n_scope.join('.')
      end
    end
  end
end
