require 'rails_helper'

describe AttendeesController do
  pending "add some examples to (or delete) #{__FILE__}"
=begin
    context 'When logged in' do
        describe "#create" do
            #fixtures :users
            fixtures :events
            fixtures :attendees
            
            before :each do
                @event = events(:vegan_potluck)
                @id = 1
                @user = double(:id => @id)
                #@user = users(:user_jcipoll)
                @attendee = attendees(:attendee_1)
                
            end
            
            let(:params) { {:user_id => @user.id, :event_id => @event.id} }
            
            it "invokes model method to create" do
                expect(Attendee).to receive(:create!).with(params).and_return(@attendee)
                post :create, attendees: params
                
            end
        end
    end
=end
end