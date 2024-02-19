class Student < ApplicationRecord
    has_many :slots
    has_many :coaches, through: :slots
    has_many :reviews, through: :slots
end
