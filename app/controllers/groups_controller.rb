class GroupsController < ApplicationController
  before_action :authenticate_user!

  def new
    @group = Group.new
    respond_to do |format|
      format.html { render :new }
    end
  end
end
