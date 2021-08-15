class Information < ApplicationRecord
  validates :data, presence: true
  validates :title, presence: true
end
