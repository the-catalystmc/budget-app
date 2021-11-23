class ReportsController < ApplicationController
  before_action :authenticate_user!

  def new
    @report = Report.new
  end

  def create
    user = current_user
    report = user.reports.new(report_params)

    if report.save
      flash[:notice] = 'Category added successfully'
      redirect_to reports_path
    else
      flash[:error] = report.errors.messages
      render :new
    end
  end

  private

  def report_params
    params.require(:report).permit(:name, :amount)
  end
end
