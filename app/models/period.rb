class Period < ActiveRecord::Base
  has_many :users_periods
  has_many :users, through: :users_periods

  validates :period_name, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end