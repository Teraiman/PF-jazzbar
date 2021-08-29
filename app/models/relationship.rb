class Relationship < ApplicationRecord
  belongs_to :artist
  belongs_to :schedule
end
