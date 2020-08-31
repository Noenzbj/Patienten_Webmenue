class Patient < ApplicationRecord
  validates :first_name, presence: true, length: {minimum: 1, maximum: 50 }
  validates :last_name, presence: true, length: {minimum: 1, maximum: 50 }
  validates :station, presence: true
end