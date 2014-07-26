class Event < ActiveRecord::Base
  belongs_to :period

  enum event_type: [:teaching, :planning]
end
