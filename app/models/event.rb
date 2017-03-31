class Event < ActiveRecord::Base
    def self.sort_options
        return ['name','date']
    end
end