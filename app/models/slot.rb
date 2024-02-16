class Slot < ApplicationRecord
  belongs_to :coach

  has_one :student
  has_one :review
end
