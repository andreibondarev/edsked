class Event < ActiveRecord::Base
  belongs_to :period

  has_many :events_users
  has_many :users, through: :events_users

  enum event_type: [:observation, :post_conference]

  accepts_nested_attributes_for :events_users

  validates :event_date, presence: true
  validates :event_type, presence: true
  validates :period, presence: true

  
end
