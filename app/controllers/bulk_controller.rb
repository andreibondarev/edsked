class BulkController < ApplicationController
  before_filter :authenticate_user!
  # POST /events
  # POST /events.json
  def create
    bulk = bulk_params

    bulk[:users].each do |user|
      date, period_id = match_period(user, bulk[:start_date], bulk[:end_date])
      Event.create(event_type: :observation, event_date: date, period_id: period_id) unless date.nil?
    end

  end

  private
    def match_period(user, start_date, end_date)
      start_date..end_date.each |date|
        Period.all.each do |p|
          if current_user.free_period?(p) and teacher.free_period?(p)
            return [date, p.id]
          end
        end
      end
      return nil
    end

    def bulk_params
      params[:bulk].permit(:start_date, :end_date, :users)
    end
end