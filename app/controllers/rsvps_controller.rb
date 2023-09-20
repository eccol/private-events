class RsvpsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @rsvp = current_user.rsvps.build(event: @event)

    if @rsvp.save
      flash[:success] = "Added!"
      redirect_to @event
    else
      flash[:error] = "Not added."
      redirect_to @event
    end
  end
end
