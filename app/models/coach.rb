class Coach < ApplicationRecord
    has_many :slots
    has_many :students, through: :slots
    has_many :reviews, through: :slots
end
