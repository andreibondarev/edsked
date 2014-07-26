class EventsUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  validate :user, presence: true
  validate :event, presence: true
end
