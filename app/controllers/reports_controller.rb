class ReportsController < ApplicationController
  before_action :authenticate_user!

  def new
    @group = Group.find(params[:group_id])
    @report = Report.new
  end

  def create
    report = current_user.reports.create(report_params)
    group = Group.find(params[:group_id])
    params[:groups].each do |g|
      report.groups << Group.find(g)
    end

    if report.save
      flash[:notice] = 'Category added successfully'
      redirect_to group_path(group)
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
