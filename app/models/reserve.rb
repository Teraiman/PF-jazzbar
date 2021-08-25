class Reserve < ApplicationRecord
  belongs_to :customer
  belongs_to :schedule

  validates :count, presence: true
  
end
