require 'rails_helper'

describe EventsController do
    describe "create new event" do
      #params = {:title => "test event"}
      let(:params) { {:name => "test event"} }
      #event = the double   first string useless but needed
      let(:event) { double('event', params) }
      
      it "calls the model method to create a new event" do
        allow(event).to receive(:update_attributes)
        expect(Event).to receive(:create!).with(params).and_return(event)
        post :create, event: params
      end
      
      it "sets the flash message" do
        allow(event).to receive(:update_attributes)
        allow(Event).to receive(:create!).with(params).and_return(event)
        post :create, event: params
        expect(flash[:notice]).to match(/^.* was successfully created.$/) 
      end
      
      it "redirects to the events index" do
        allow(event).to receive(:update_attributes)
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
        @event4 = events(:vegan_not_potluck)
        @fake_results = [@event1,@event2,@event3,@event4]
        @fake_filtered_results = [@event2, @event3, @event4]
        @fake_sort_by_name = [@event2,@event3,@event1,@event4]
        @fake_sort_by_date = [@event3,@event4,@event2,@event1]
        @start = '5-Jan-2017'
        @end = '31-Oct-2017'
        @empty_results = []
        @fake_results_2 = [@event1, @event4]
        @good_term = "vegan"
        @bad_term = "hello"
      end
      

      
      context 'finds all events on homepage' do
        
      
      
        it "finds all events" do
          expect(Event).to receive(:all)
          get :index
        end
        
        it "sends all events to view" do
          allow(Event).to receive(:all).and_return(@fake_results)
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
          @fake_params = {:sort => {"name" => "1"}}
          get :index, @fake_params
          expect(assigns(:events)).to eq(@fake_sort_by_name)
        end
        
      end
      
      context 'sort by date' do
        
        it "returns events sorted by date" do
          @fake_params = {:sort => {"date" => "1"}}
          get :index, @fake_params
          expect(assigns(:events)).to eq(@fake_sort_by_date)
        end
        
      end
      
      context 'search by name' do
        
        #happy path
        it "finds results for valid search" do
          expect(Event).to receive(:search_by_name).with(@good_term).and_return(@fake_results_2)
          get :index, {:search => @good_term}
        end
        
        it "assigns the variable" do
          allow(Event).to receive(:search_by_name).with(@good_term).and_return(@fake_results_2)
          get :index, {:search => @good_term}
          expect(assigns(:events)).to eq(@fake_results_2)
        end
        
        #sad path
        it "doesn't finds results for invalid search" do
          expect(Event).to receive(:search_by_name).with(@bad_term).and_return(@empty_results)
          get :index, {:search => @bad_term}
        end
        
        it "assigns the variable" do
          allow(Event).to receive(:search_by_name).with(@bad_term).and_return(@empty_results)
          get :index, {:search => @bad_term}
          expect(assigns(:events)).to eq(@empty_results)
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
        
        auth = {
          provider: "google",
          uid: "12345678910",
          info: {
            name: "Jesse",
          },
          credentials: {
            token: "abcdefg12345",
            expires_at: DateTime.now
          }
        }
        User.from_omniauth(auth)
        @user = User.first
        @session[:user_id] = @user.id
        @hidden = 'hidden'
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
      
      context 'user is already attending' do

        it "checks for user" do
          expect(User).to receive(:find_by_id).with(@session).and_return(@user)
          allow(User).to receive(:find_by_id).with(@event.user_id).and_return(@user)
          get :show, {:id => @id}
        end

        it "sets values for view" do
          allow(User).to receive(:find_by_id).and_return(@user)
          allow(@event).to receive(:users).and_return(true)
          get :show, {:id => @id}
          expect(assigns :attend_class).to eq(@hidden)
          expect(assigns :attend_text).to eq(@hidden)
          expect(assigns :nevermind_text).to eq('Nevermind?')
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
      fixtures :events, :users
      
      before :each do
        @event = events(:vegan_potluck)
        @user = users(:user_tmodell)
        @id = @event.id
        @name = @event.name
        @date = @event.date
        @description = @event.description
        @ingredients = @event.ingredients
        allow(controller).to receive(:current_user).and_return(@user)
      end
      it "calls the find method to retrieve the event" do 
        expect(Event).to receive(:find).with(@id.to_s).and_return(@event)
        expect(Event).to receive(:find).with(@id.to_s).and_return(@event)
        get :destroy,  {:id => @id}
      end 
      
      it "calls the destroy method to delete the event" do 
        expect(Event).to receive(:find).with(@id.to_s).and_return(@event)
        expect(Event).to receive(:find).with(@id.to_s).and_return(@event)
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
    
    describe "#require_permission" do
      fixtures :events, :users
      before do
        @event = events(:meat_festival)
        @id = @event.id
        @user = users(:user_tmodell)
        allow(controller).to receive(:current_user).and_return(@user)
      end
 
      it "redirects to the index page" do
        expect(Event).to receive(:find).with(@id.to_s).and_return(@event)
        get :destroy,  {:id => @id}
        expect(response).to redirect_to(events_path)
      end
      
  end
end 

