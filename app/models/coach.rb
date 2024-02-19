class Coach < ApplicationRecord
    has_many :slots, dependent: :destroy
    has_many :students, through: :slots
    has_many :reviews, through: :slots
end
