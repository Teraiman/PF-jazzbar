class Artist < ApplicationRecord
  has_many :notifications
  has_many :relationships

  belongs_to :part

  validates :name, presence: true, uniqueness: true

end
