class Period < ActiveRecord::Base
  has_many :users_periods
  has_many :users, through: :users_periods
end