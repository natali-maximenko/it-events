class Event < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 15 }
  validates :started_at, presence: true
end
