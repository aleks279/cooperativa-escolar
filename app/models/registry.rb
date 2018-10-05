class Registry < ApplicationRecord
  validates :registry_type, presence: true

  belongs_to :user
end
