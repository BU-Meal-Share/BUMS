class Event < ActiveRecord::Base

    serialize :tagsArray
    
    has_many :attendees
    has_many :users, :through => :attendees

    def self.sort_options
        return ['name','date']
    end
    
end