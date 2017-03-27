class Event < ActiveRecord::Base
    def self.get_sort_options
        return ['name','date']
    end
end