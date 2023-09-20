class UsersController < ApplicationController
  def show
    @user = current_user
    @events = Event.find_by(creator_id: current_user.id)
  end
end
