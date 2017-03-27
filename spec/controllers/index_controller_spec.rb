require 'rails_helper'

describe EventsController do
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
      
      context 'sort by name' do
        
        it "returns only events within that range" do
          get :index, {:name => "1"} 
          expect(assigns(:events)).to eq(@fake_sort_by_name)
        end
      end
      
      context 'sort by date' do
        
        it "returns only events within that range" do
          get :index, {:date => "1"} 
          expect(assigns(:events)).to eq(@fake_sort_by_date)
        end
      end
    end
end 

