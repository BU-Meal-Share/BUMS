class EventsController < ApplicationController
  
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
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
