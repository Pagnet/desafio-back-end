# frozen_string_literal: true

module Helpers
  def json_body
    @json_body ||= JSON.parse(response.body, symbolize_names: true)
  end
end
