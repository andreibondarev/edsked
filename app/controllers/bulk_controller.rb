class BulkController < ApplicationController
  before_filter :authenticate_user!

  ### TODO, HANDLE SILENT ERRORS -- aka no time slots open
  def create
    bulk = bulk_params

    bulk[:users].each do |user|
      event = create_event(user, start_date, end_date, :observation)
      create_event(user, event.event_date, event.event_date+2.days, :post_conference)
    end
  end

  private
    def create_event(user, start_date, end_date, type)
      event = nil
      date, period_id = match_period(user, start_date, start_date)
      unless date.nil?
        event = Event.create(event_type: type, event_date: date, period_id: period_id) 
        EventsUser.create(user_id: current_user.id, event_id: event.id)
        EventsUser.create(user_id: user.id, event_id: event.id)
      end
      return event
    end

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