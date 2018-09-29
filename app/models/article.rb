class Article < ApplicationRecord
  validates :title, :published, presence: true

  belongs_to :user
  has_many :sections

  accepts_nested_attributes_for :sections
end
