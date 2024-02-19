class Slot < ApplicationRecord
  belongs_to :coach
  belongs_to :student, optional: true
  has_one :review
end
