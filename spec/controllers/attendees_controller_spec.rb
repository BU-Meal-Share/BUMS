require 'rails_helper'

describe AttendeesController do
  #pending "add some examples to (or delete) #{__FILE__}"
    context 'When logged in' do
        describe "#create" do
            #fixtures :users
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

            #fixtures :events
            fixtures :attendees
            
            before :each do
                #@event = events(:vegan_potluck)
                @id = 1
                #@user = double(:id => @id)
                @event = double(:id => @id)
                @user = User.first
                @attendee = attendees(:attendee_1)
            end
            
            let(:params) { {:event_id => @event.id} }
            
            it "invokes model method to create" do
                expect(Attendee).to receive(:create!).with(params).and_return(@attendee)
                post :create, {:event_id => @event.id}, {:event_id => @event.id}
                #post :create, {:event_id => @event.id}, {:user_id => @user.id, :event_id => @event.id}
                #{:user_id => @user.id, :event_id => @event.id} #event_id: @event.id #attendees: params
                
            end
        end
    end
end