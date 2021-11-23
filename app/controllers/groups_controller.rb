class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = current_user.groups
    @total = helpers.total_expenses_all
  end

  def new
    @group = Group.new
    respond_to do |format|
      format.html { render :new }
    end
  end

  def create
    user = current_user
    group = user.groups.new(group_params)

    if group.save
      flash[:notice] = 'Category added successfully'
      redirect_to groups_path
    else
      flash[:error] = group.errors.messages
      render :new
    end
  end

  def show
    @group = Group.find(params[:id])
    @reports = @group.reports
  end
end
