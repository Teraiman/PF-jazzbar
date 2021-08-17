class Part < ApplicationRecord
  has_many :artists

  validates :part_name, presence: true
end
