class Registry < ApplicationRecord
  validates :time, :registry_type, presence: true

  belongs_to :user
end
