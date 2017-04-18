class Event < ActiveRecord::Base
#    serialize :tagsArray
    serialize :ethnicity, Hash
    serialize :dietary_restrictions, Hash
    serialize :category, Hash
    
    def self.sort_options
        return ['name','date']
    end
    
    def self.ethnicity_options
        return ['African', 'American', 'Asian', 'French', 'Indian', 'Italian', 'Latin American', 'Mediterranean', 'Middle Eastern', 'Spanish', 'N/A']
    end
    
    def self.dietary_restrictions_options
       return ['Gluten Free', 'Nut Free' , 'Vegetarian', 'Vegan',  'Paleo' ,'Keto' , 'Kosher' ,'N/A'] 
    end
    
    def self.category_options
        return ['Potluck', 'Restaurant', 'Breakfast', 'Brunch', 'Lunch', 'Dinner', 'All-day', 'Other']
    end
end