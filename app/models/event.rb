class Event < ActiveRecord::Base
    serialize :tagsArray
    def self.sort_options
        return ['name','date']
    end
end