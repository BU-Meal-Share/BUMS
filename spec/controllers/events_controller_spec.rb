require 'rails_helper'

describe EventsController do
    describe "create new event" do
      #params = {:title => "test event"}
      let(:params) { {:name => "test event"} }
      #event = the double   first string useless but needed
      let(:event) { double('event', params) }
      
      it "calls the model method to create a new event" do
        expect(Event).to receive(:create!).with(params).and_return(event)
        post :create, event: params
      end
      
      it "sets the flash message" do
        allow(Event).to receive(:create!).with(params).and_return(event)
        post :create, event: params
        expect(flash[:notice]).to match(/^.* was successfully created.$/) 
      end
      
      it "redirects to the events index" do
        allow(Event).to receive(:create!).with(params).and_return(event)
        post :create, event: params
        expect(response).to redirect_to(events_path)
      end
    end
    
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
end 

