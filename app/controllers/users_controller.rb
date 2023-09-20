class UsersController < ApplicationController
  def show
    @user = current_user
    @created_events = current_user.created_events.all
    @attended_events = current_user.attended_events.all
  end
end
