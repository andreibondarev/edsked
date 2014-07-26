class PeriodsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @period = Period.new
  end

  def index
  	@periods = Period.all
  end

  def create
    @period = Period.new(period_params)
    if @period.save
      flash[:success] = "Period saved successfully."
      @periods = Period.all
      render 'index'
    else
      render 'new'
    end
  end

  def edit
  	@period = Period.find(params[:id])
  end

  def update
  	@period = Period.find(params[:id])
    if @period.update_attributes(period_params)
      flash[:success] = "Period saved successfully."
      @periods = Period.all
      render 'index'
    else
      render 'edit'
    end

  end

  def show
  	@period = Period.find(params[:id])
  end

  private

  def period_params
    params.require(:period).permit(:period_name, :start_time, :end_time)
  end

end
