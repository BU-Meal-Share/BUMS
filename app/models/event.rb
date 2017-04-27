class Event < ActiveRecord::Base
#    serialize :tagsArray
    serialize :ethnicity, Hash
    serialize :dietary_restrictions, Hash
    serialize :category, Hash
    
    def self.sort_options
        return ['name','date']
    end
    
    def self.ethnicity_options
        return [:African, :American, :Asian, :French, :Indian, :Italian, :Latin_American, :Mediterranean, :Middle_Eastern, :Spanish, :NA]
    end
    
    def self.dietary_restrictions_options
       return [:Gluten_Free, :Nut_Free , :Vegetarian, :Vegan,  :Paleo, :Keto, :Kosher, :NA] 
    end
    
    def self.category_options
        return [:Potluck, :Restaurant, :Breakfast, :Brunch, :Lunch, :Dinner, :All_day, :Other]
    end
end