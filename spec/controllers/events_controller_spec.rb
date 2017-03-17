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
end 

