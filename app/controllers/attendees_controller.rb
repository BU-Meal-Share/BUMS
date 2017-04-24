class AttendeesController < ApplicationController
  before_filter :has_user_and_event, :only => [:create, :destroy]
  protected
  def has_user_and_event
    @current_user = User.find_by_id(session[:user_id])
    unless @current_user
      flash[:warning] = 'You must be logged in to Attend an event.'
      redirect_to event_path(params[:event_id])
#      redirect_to "/auth/google_oauth2"
    end
    unless (@event = Event.where(:id => params[:event_id]))
      flash[:warning] = 'Attending must be for an existing event.'
      redirect_to events_path
    end
  end
  
  private
  def event_params
    params.require(:event).permit(:name, :date, :description, :ingredients, :minPartySize, :curPartySize, :maxPartySize, :tags, :recipes, :location, :image, :user_id)
  end
  
  public
  def create
    # since user_id is a protected attribute that won't get
    # assigned by the mass-assignment from params[:attendee], we set it
    # by using the << method on the association.  We could also
    # set it manually with attendee.user = @current_user.
    # @current_user.attendees << @event.attendees.build(params[:attendee])
    #attendee.user = @current_user
    @attendee = Attendee.create!(:user_id => @current_user.id, :event_id => params[:event_id])
    @event = Event.find_by_id(params[:event_id])
    redirect_to event_path(@event)
  end
  def destroy
    @attendee = Attendee.find(params[:id])
    @attendee.destroy
#    attendees.find_by(event_id: params[:event_id], user_id: params[:id]).destroy
    @event = Event.find_by_id(params[:event_id])
    redirect_to event_path(@event)
  end
end