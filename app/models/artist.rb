class Artist < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :relationships
  has_many :schedules, through: :relationships
  has_many :customers, through: :favorites

  belongs_to :part

  validates :name, presence: true, uniqueness: true

end
