class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    puts params
    @event = Event.find(params[:id])
    @attendees = @event.attendees
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def event_params
    params.require(:event).permit(:title,:location,:date)
  end
end
