class FileHandleWorker
  include Sidekiq::Worker
  sidekiq_options queue: :handle_file, retry: 3

  def self.enqueue(attached_file)
    self.perform_async('attached_file_id' => attached_file.id)
  end

  def perform(params)
    attached_file = AttachedFile.find_by(id: params['attached_file_id'])
    result = attached_file.process
    if result.failure?
      logger.error(
        'Failed to process attached_file %s. Errors: %s' % [
          attached_file.id,
          result.errors
        ]
      )
    end
  end
end
