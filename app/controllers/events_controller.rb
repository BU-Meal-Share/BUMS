class EventsController < ApplicationController
  
  def event_params
    params.require(:event).permit(:name, :date, :description, :ingredients, :minPartySize, :curPartySize, :maxPartySize, :tags, :recipes, :location, :image, :tagsArray)
  end
  
  def show
    id = params[:id]
    @event = Event.find(id)
  end

  def index
    @sort_options = Event.sort_options
    
    #load defaults into session
    session[:start] = '' unless session.has_key?  :start
    session[:end]   = '' unless session.has_key?  :end
    session[:sort]  = ['date'] unless session.has_key? :sort
    
    @start = params[:start] || session[:start]
    @end   = params[:end]   || session[:end]
    @sort  = params[:sort]  || session[:sort]
    
    @sort  = @sort.keys unless @sort.class == Array
    
    if @start.blank? or @end.blank?
      @events = Event.all
    else
      @events = Event.where(:date => @start.to_time..@end.to_time)
    end
    
    @sort.each do |option|
      @events = @events.order(option.to_sym) unless @events.nil? or @events.class == Array
    end
    
    @events = @events.to_a
    
    # Save session settings
    session[:start] = @start
    session[:end]   = @end
    session[:sort]  = @sort
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
