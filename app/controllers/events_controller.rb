class EventsController < ApplicationController
  
  def event_params
    params.require(:event).permit(:name, :date, :description, :ingredients, :minPartySize, :curPartySize, :maxPartySize, :tags, :recipes, :location, :image)
  end
  
  def show
    id = params[:id]
    @event = Event.find(id)
  end

  def index
    @start = params[:start]
    @end = params[:end]
    if @start.nil? or @end.nil?
      @events = Event.all
    else
      @events = Event.where(:date => @start.to_time..@end.to_time).to_a
      p @events
     end
  end

  def new
  end

  def create
    @event = Event.create!(event_params)
    flash[:notice] = "#{@event.name} was successfully created."
    redirect_to events_path
  end

  def edit
    id = params[:id]
    @event = Event.find(id)
  end

  def update
    @event = Event.find params[:id]
    @event.update_attributes!(event_params)
    flash[:notice] = "#{@event.name} was successfully updated."
    redirect_to events_path
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "Event '#{@event.name}' deleted"
    redirect_to events_path
  end

end
