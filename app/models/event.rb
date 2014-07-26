class Event < ActiveRecord::Base
  belongs_to :period

  has_many :events_users
  has_many :users, through: :events_users

  enum event_type: [:teaching, :planning]

  accepts_nested_attributes_for :events_users
end
