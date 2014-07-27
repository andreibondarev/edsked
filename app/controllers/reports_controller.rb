class ReportsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @report = ReportForm.new
  end

  def create
    @report = ReportForm.new(params[:report_form])
    if @report.valid?
      #LOL
      sleep(2)
      send_file './Report_7-27-14.pdf', :type => 'image/pdf'
    else
      render :new
    end
  end
end
