require 'rails_helper'

describe EventsController do
    describe "#index" do
      fixtures :events
      
      before :each do
        @event1 = events(:vegan_potluck)
        @event2 = events(:meat_festival)
        @event3 = events(:taco_tuesday)
        @fake_results = [@event1,@event2,@event3]
      end
      
      context 'finds all events on homepage' do
      
        it "finds all events" do
          expect(Event).to receive(:all)
          get :index
        end
        
        it "sends all events to view" do
          get :index
          expect(assigns(:events)).to eq(@fake_results)
        end
      end
    end
    describe "#show" do
      fixtures :events
      
      before :each do
        @event = events(:vegan_potluck)
        @id = @event.id
        @name = @event.name
        @date = @event.date
        @description = @event.description
        @ingredients = @event.ingredients
      end
      
      context 'finds all events on homepage' do
      
        it "finds the event" do
          expect(Event).to receive(:find).with(@id.to_s).and_return(@event)
          get :show,  {:id => @id}
        end
        
        it "sends event to view" do
          get :show, {:id => @id}
          expect(assigns(:event)).to eq(@event)
        end
      end
    end
    
    describe "#edit" do
      fixtures :events
      
      before :each do
        @event = events(:vegan_potluck)
        @id = @event.id
        @name = @event.name
        @date = @event.date
        @description = @event.description
        @ingredients = @event.ingredients
      end
      context 'edit the event' do
        it "sends event to view" do
          get :edit, {:id => @id}
          expect(assigns(:event)).to eq(@event)
        end

      end
    end
      
    describe "#destroy" do
      it "calls the find method to retrieve the event" do 
        expect(Event).to receive(:find).with(@id.to_s).and_return(@event)
        get :destroy,  {:id => @id}
      end 
      
      it "calls the destroy method to delete the event" do 
        allow(Event).to receive(:find).with(@id.to_s).and_return(@event)
        expect(@event).to receive(:destroy)
        get :destroy,  {:id => @id}
      end
      
      it "sets the flash message" do
        allow(Event).to receive(:find).with(@id.to_s).and_return(@event)
        allow(@event).to receive(:destroy)
        get :destroy,  {:id => @id}
        expect(flash[:notice]).to eq("Event '#{@name}' deleted")
      end 
      
      it "redirects to the index page" do
        get :destroy,  {:id => @id}
        expect(response).to redirect_to(events_path)
      end
    end
end 

