class ApplicationRecord < ActiveRecord::Base
  before_create :set_uuid
  self.abstract_class = true

  def set_uuid
    self.id = SecureRandom.uuid
  end
end
