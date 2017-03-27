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
        @fake_filtered_results = [@event2, @event3]
        @fake_sort_by_name = [@event2,@event3,@event1]
        @fake_sort_by_date = [@event3,@event2,@event1]
        @start = '5-Jan-2017'
        @end = '31-Oct-2017'
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
      
      context 'filters all events on homepage' do
      
        it "queries for events in date range" do
          expect(Event).to receive(:where)
          get :index, {:start => @start, :end => @end} 
        end
        
        it "returns only events within that range" do
          allow(Event).to receive(:where).and_return(@fake_filtered_results)
          get :index, {:start => @start, :end => @end} 
          expect(assigns(:events)).to eq(@fake_filtered_results)
        end
        
      end
      
      context 'sort by name' do
        
        it "returns events sorted by name" do
          get :index, {:name => "1"} 
          expect(assigns(:events)).to eq(@fake_sort_by_name)
        end
      end
      
      context 'sort by date' do
        
        it "returns events sorted by date" do
          get :index, {:date => "1"} 
          expect(assigns(:events)).to eq(@fake_sort_by_date)
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
      fixtures :events
      
      before :each do
        @event = events(:vegan_potluck)
        @id = @event.id
        @name = @event.name
        @date = @event.date
        @description = @event.description
        @ingredients = @event.ingredients
      end
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

