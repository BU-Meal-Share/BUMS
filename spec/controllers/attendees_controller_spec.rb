require 'rails_helper'

describe AttendeesController do
    context 'when not logged in' do
        describe "#create" do

            before :each do
                @id = "1"
                @event = double(:id => @id)
                @user = nil
                @params = {event_id: @event.id}
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
            it "redirects to events page" do
                allow(User).to receive(:find_by_id).and_return(@user)
                post :create, @params
                expect(response).to redirect_to event_path(@params[:event_id])
            end
        end
        describe "#destroy" do
            fixtures :attendees
            
            before :each do
                @id = "1"
                @event = double(:id => @id)
                @user = nil
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
            
            it 'Send warning message for need to log in' do 
                allow(User).to receive(:find_by_id).and_return(@user)
                delete :destroy, @params
                expect(flash[:warning]).to eq("You must be logged in to Attend an event.")
            end    
            it "redirects to events page" do
                allow(User).to receive(:find_by_id).and_return(@user)
                delete :destroy, @params
                expect(response).to redirect_to event_path(@params[:event_id])
            end
        end
    end
    
    context 'when event does not exist' do
        describe "#create" do
            
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
                @params = {event_id: @event.id, user_id: @user.id}
                @session[:user_id] = @user.id
            end
            
            it 'Query Event for Where' do 
                allow(User).to receive(:find_by_id).and_return(@user)
                expect(Event).to receive(:where).with(:id => @params[:event_id])
                post :create, @params
            end      
            it 'Send warning message for event not existing' do 
                allow(User).to receive(:find_by_id).and_return(@user)
                allow(Event).to receive(:where)
                post :create, @params
                expect(flash[:warning]).to eq("Attending must be for an existing event.")
            end       
            it "redirects to events page" do
                allow(User).to receive(:find_by_id).and_return(@user)
                allow(Event).to receive(:where)
                post :create, @params
                expect(response).to redirect_to events_path
            end
        end
        describe "#destroy" do
            
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
                @attendee = attendees(:attendee_1)
                @params = {event_id: @event.id, id: @attendee.id}
                @session[:user_id] = @user.id
            end
            
            it 'Query Event for Where' do 
                allow(User).to receive(:find_by_id).and_return(@user)
                expect(Event).to receive(:where).with(:id => @params[:event_id])
                delete :destroy, @params
            end  
            it 'Send warning message for event not existing' do 
                allow(User).to receive(:find_by_id).and_return(@user)
                allow(Event).to receive(:where)
                delete :destroy, @params
                expect(flash[:warning]).to eq("Attending must be for an existing event.")
            end
            
            it "redirects to events page" do
                allow(User).to receive(:find_by_id).and_return(@user)
                allow(Event).to receive(:where)
                delete :destroy, @params
                expect(response).to redirect_to events_path
            end
        end
    end

    context 'When logged in' do
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

                @id = "1"
                @event = double(:id => @id)
                @user = User.first
                @attendee = attendees(:attendee_1)
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
            it "redirects to event show page" do
                allow(User).to receive(:find_by_id).and_return(@user)
                allow(Attendee).to receive(:create!).and_return(@attendee)
                allow(Event).to receive(:find_by_id).and_return(@event)
                post :create, @params
                expect(response).to redirect_to event_path(@event)
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
            it "redirects to event show page" do
                allow(User).to receive(:find_by_id).and_return(@user)
                allow(Attendee).to receive(:find).and_return(@attendee)
                allow(@attendee).to receive(:destroy)
                allow(Event).to receive(:find_by_id).and_return(@event)
                delete :destroy, @params
                expect(response).to redirect_to event_path(@event)
            end
        end
    end
end