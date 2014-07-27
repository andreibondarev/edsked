class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [ :student, :assistant, :teacher, :administrator, :principal ]
         
  has_many :events_users         
  has_many :events, through: :events_users

  has_many :users_periods
  has_many :periods, through: :users_periods

  def full_name
    "#{first_name} #{last_name}"
  end

  def admin?
    self.administrator? || self.principal?
  end

  def free_period?(period)
    events = self.events_users.pluck(:event_id) 
    !events.empty? {|event| event.period_id == period.id }
  end
end
