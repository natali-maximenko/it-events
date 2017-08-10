class Event < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 15 }
  validates :started_at, presence: true

  mount_uploader :cover, PictureUploader
  # paging
  self.per_page = 10

  scope :order_started_at_desc, -> { order(started_at: :desc) }
  scope :past, -> { where('started_at <= ?', Time.now).order_started_at_desc }
  scope :upcoming, -> { where('started_at > ?', Time.now).order_started_at_desc }
  # filter
  scope :start_date, ->(date) { where('started_at >= ?', date) }
  scope :end_date, ->(date) { where('started_at <= ?', date) }

  def self.filter(attrs)
    events = order_started_at_desc
    attrs.each do |key, value|
      events = events.send(key, value) if value.present?
    end
    events
  end
end
