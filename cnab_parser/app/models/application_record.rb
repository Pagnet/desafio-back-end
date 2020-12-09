# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.message(field)
    I18n.t('models.validate', param: field)
  end
end
