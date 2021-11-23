class GroupsController < ApplicationController
    before_action :authenticate_user!

    def new
        @user = User.find(params[:user_id])
        @current_user = current_user
        @post = Post.new
        respond_to do |format|
          format.html { render :new }
        end
    end
end
