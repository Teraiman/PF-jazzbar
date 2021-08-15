class Schedule < ApplicationRecord
  has_many :reserves
  has_many :relationships

  validates :title, presence: true
  validates :data, presence: true
  validates :time, presence: true
  validates :charge, presence: true

end
