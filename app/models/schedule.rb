class Schedule < ApplicationRecord
  has_many :reserves, dependent: :destroy
  has_many :relationships, dependent: :destroy
  has_many :artists, through: :relationships
  accepts_nested_attributes_for :artists




  attachment :image

  validates :title, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validates :charge, presence: true

end
