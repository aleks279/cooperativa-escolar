class Article < ApplicationRecord
  validates :title, presence: true

  belongs_to :user
  has_many :sections, dependent: :destroy

  accepts_nested_attributes_for :sections
end
