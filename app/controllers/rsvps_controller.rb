class RsvpsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    if params[:event][:email]
      invitee = User.find_by(email: params[:event][:email])
    else
      invitee = current_user
    end
  @rsvp = invitee.nil? ? nil : invitee.rsvps.build(event: @event)

    if @rsvp.save
      flash[:success] = "Added!"
      redirect_to @event
    else
      flash[:error] = "Not added."
      redirect_to @event
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    @event.rsvps.find_by(user_id: current_user.id).destroy
    redirect_to @event
  end
end
