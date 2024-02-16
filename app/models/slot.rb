class Slot < ApplicationRecord
  belongs_to :coach
  belongs_to :student
  belongs_to :review
end
