require 'rails_helper'

describe AttendeesController do
    context 'when not logged in' do
        describe "#create" do
            fixtures :attendees
            
            before :each do
                @id = "1"
                @event = double(:id => @id)
                @user = nil
                #@attendee = double(:id => @id, :user_id => @id, :event_id => @id)
                @attendee = attendees(:attendee_1)
                @params = {event_id: @event.id, id: @attendee.id}
                @session[:user_id] = ''
            end
            
            it "Checks for id" do
                expect(User).to receive(:find_by_id).with(@session).and_return(@user)
                post :create, @params
            end
            it 'Checks if current_user is Nil' do
                allow(User).to receive(:find_by_id).and_return(@user)
                expect(@user).to eq(nil)
                post :create, @params
            end
            it 'Send warning message' do 
                allow(User).to receive(:find_by_id).and_return(@user)
                post :create, @params
                expect(flash[:warning]).to eq("You must be logged in to Attend an event.")
            end     
        end
        describe "#destroy" do
            fixtures :attendees
            
            before :each do
                @id = "1"
                @event = double(:id => @id)
                @user = nil
                #@attendee = double(:id => @id, :user_id => @id, :event_id => @id)
                @attendee = attendees(:attendee_1)
                @params = {event_id: @event.id, id: @attendee.id}
                @session[:user_id] = ''
            end
            
            it "Checks for id" do
                expect(User).to receive(:find_by_id).with(@session).and_return(@user)
                delete :destroy, @params
            end
            
            it 'Checks if current_user is Nil' do
                allow(User).to receive(:find_by_id).and_return(@user)
                expect(@user).to eq(nil)
                delete :destroy, @params
            end
            
            it 'Send warning message' do 
                allow(User).to receive(:find_by_id).and_return(@user)
                delete :destroy, @params
                expect(flash[:warning]).to eq("You must be logged in to Attend an event.")
            end            
        end
    end
=begin
    context 'when event does not exist' do
        describe "#create" do
            fixtures :attendees
            
            before :each do
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
                
                @id = nil
                @event = double(:id => @id)
                @user = User.first
                #@attendee = double(:id => @id, :user_id => @id, :event_id => @id)
                @attendee = attendees(:attendee_1)
                @params = {event_id: @event.id, id: @attendee.id}
                @session[:user_id] = @user.id
            end
            
            it 'Checks if current_user is Nil' do
                allow(User).to receive(:find_by_id).and_return(@user)
                expect(Event).to receive(:where).with(:id => @params).and_return(nil)
                post :create, @params
            end
        end
        describe "#destroy" do
        end
    end
=end
    context 'When logged in' do
        describe "#create" do
            #fixtures :users
            #fixtures :events
            fixtures :attendees
            
            before :each do
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
                
                
                #@event = events(:vegan_potluck)
                @id = "1"
                @event = double(:id => @id)
                @user = User.first
                #@attendee_attributes = FactoryGirl.attributes_for(:attendee, :event_id => @event)
                @attendee = attendees(:attendee_1)
                #@params = double(:event_id => @event.id , :user_id => @user.id)
                @params = {event_id: @event.id, user_id: @user.id}
                @session[:user_id] = @user.id
            end
            
            it "Checks for id" do
                expect(User).to receive(:find_by_id).with(@session).and_return(@user)
                post :create, @params
            end
            
            it "invokes model method to create" do
                allow(User).to receive(:find_by_id).and_return(@user)
                expect(Attendee).to receive(:create!).with(@params).and_return(@attendee)
                post :create, @params
            end
            
            it "finds event id" do
                allow(User).to receive(:find_by_id).and_return(@user)
                allow(Attendee).to receive(:create!).and_return(@attendee)
                expect(Event).to receive(:find_by_id).with(@event.id).and_return(@event)
                post :create, @params
            end
            
        end
        describe '#destroy' do
            fixtures :attendees
            
            before :each do
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
                @id = "1"
                @event = double(:id => @id)
                @user = User.first
                #@attendee = double(:id => @id, :user_id => @id, :event_id => @id)
                @attendee = attendees(:attendee_1)
                @params = {event_id: @event.id, id: @attendee.id}
                @session[:user_id] = @user.id
            end
            
            it "Checks for id" do
                expect(User).to receive(:find_by_id).with(@session).and_return(@user)
                delete :destroy, @params
            end
            
            it "looks up attendee to destroy" do
                allow(User).to receive(:find_by_id).and_return(@user)
                expect(Attendee).to receive(:find).with(@id).and_return(@attendee)
                delete :destroy, @params
            end
        
            it "invokes model method to destroy attendee" do
                allow(User).to receive(:find_by_id).and_return(@user)
                allow(Attendee).to receive(:find).and_return(@attendee)
                expect(@attendee).to receive(:destroy)
                delete :destroy, @params
            end
            
            it "finds event id" do
                allow(User).to receive(:find_by_id).and_return(@user)
                allow(Attendee).to receive(:find).and_return(@attendee)
                allow(@attendee).to receive(:destroy)
                expect(Event).to receive(:find_by_id).with(@event.id).and_return(@event)
                delete :destroy, @params
            end
=begin            
            it "redirects to event show page" do
                allow(User).to receive(:find_by_id).and_return(@user)
                allow(Attendee).to receive(:find).and_return(@attendee)
                allow(@attendee).to receive(:destroy)
                allow(Event).to receive(:find_by_id).and_return(@event)
                expect(response).to redirect_to(event_path(@id))
                delete :destroy, @params

            end
=end
        end
    end
end