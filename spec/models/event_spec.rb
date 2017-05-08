require 'rails_helper'

describe Event do
    
    context 'finds results' do 
        fixtures :events
        
        before :each do
            @event1 = events(:vegan_potluck)
            @event2 = events(:meat_festival)
            @event3 = events(:taco_tuesday)
            @event4 = events(:vegan_not_potluck)
            @search_term = "vegan"
            @fake_results = [@event1, @event4]
        end
        
        describe "search by event name" do
    
            it "queries the database" do
                expect(Event).to receive(:where).with("name like ?", "%#{@search_term}%").and_return(@fake_results)
                Event.search_by_name @search_term
            end
                #Movie.where(:name => self.director)
                #Movie.where("title like ?", "%#{name}%")
                #Movie.new(:director => @director).similar_movies
        end
    end
    context 'does not find results' do
        fixtures :events
        
        before :each do
            @event1 = events(:vegan_potluck)
            @event2 = events(:meat_festival)
            @event3 = events(:taco_tuesday)
            @event4 = events(:vegan_not_potluck)
            @search_term = "hello"
            @fake_results = []
        end
        describe "search by event name" do

            it "queries the database" do
                expect(Event).to receive(:where).with("name like ?", "%#{@search_term}%").and_return(@fake_results)
                Event.search_by_name @search_term
            end
        end
    end
end
