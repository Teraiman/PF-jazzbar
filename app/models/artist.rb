class Artist < ApplicationRecord
  has_many :notifications
  has_many :relationships
  has_many :schedules, through: :relationships
  has_many :customers, through: :notifications

  belongs_to :part

  validates :name, presence: true, uniqueness: true

end
