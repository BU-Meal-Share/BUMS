class EventsController < ApplicationController
  
  def event_params
    p params
    params.require(:event).permit(:name, :date, :description, :ingredients)
  end
  
  
  def show
    id = params[:id]
    @event = Event.find(id)
  end

  def index
    @events = Event.all
  end

  def new
  end

  def create
    p params
    @event = Event.create!(event_params)
    flash[:notice] = "#{@event.name} was successfully created."
    redirect_to events_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
