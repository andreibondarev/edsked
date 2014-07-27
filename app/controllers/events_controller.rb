class EventsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_event, only: [:edit, :update, :destroy]

  def wizard
    @wizard_form = WizardForm.new
    render 'wizard'
  end

  ### TODO, HANDLE SILENT ERRORS -- aka no time slots open
  def create_bulk
    @wizard_form = WizardForm.new(params[:wizard_form])
    if @wizard_form.valid?
      bulk_params[:user_ids].each do |user_id|
        event = create_event(User.find(user_id), Date.strptime(bulk_params[:start_date], '%m/%d/%Y'), Date.strptime(bulk_params[:end_date], '%m/%d/%Y'), :observation)
        create_event(User.find(user_id), event.event_date.to_date, event.event_date.to_date+2.days, :post_conference)
      end
      redirect_to events_url, notice: 'Events have been scheduled'
    else
      render 'wizard'
    end
  end

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def edit; end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to events_path, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  def update
    if @event.update(event_params)
      redirect_to events_path, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url, notice: 'Event was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params[:event].permit(:event_type, :period_id, :event_date, 
      events_users_attributes: [:id, :user_id, :event_id])
  end

  def create_event(user, start_date, end_date, type)
    event = nil
    date, period_id = match_period(user, start_date, start_date, type)
    unless date.nil?
      event = Event.create(event_type: type, event_date: date, period_id: period_id) 
      EventsUser.create(user_id: current_user.id, event_id: event.id)
      EventsUser.create(user_id: user.id, event_id: event.id)
    end
    return event
  end

  def match_period(user, start_date, end_date, type)
    (start_date..end_date).each do |date|
      Period.all.each do |p|
        case type
        when :observation
          next if user.planning_period?(p)
        when :post_conference
          next unless user.planning_period?(p)
        end
        if current_user.free_period?(p, date) and user.free_period?(p, date)
          return [date, p.id]
        end
      end
    end
    return nil
  end

  def bulk_params
    params[:wizard_form].permit(:start_date, :end_date, user_ids: [])
  end    
end
