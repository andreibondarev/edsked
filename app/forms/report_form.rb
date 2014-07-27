class ReportForm
  include ActiveModel::Model

  attr_accessor :start_date, :end_date, :user_id

  validates :start_date, :end_date, presence: true

  validate :start_date_before_end_date

  private
  def start_date_before_end_date
    begin
      if Date.strptime(start_date, '%m/%d/%Y') >= Date.strptime(end_date, '%m/%d/%Y')
        errors.add(:base, 'Date range conflict')
      end
    rescue
      errors.add(:base, 'Invalid dates')
    end
  end
end