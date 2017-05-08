class Event < ActiveRecord::Base
#    serialize :tagsArray
    serialize :ethnicity, Hash
    serialize :dietary_restrictions, Hash
    serialize :category, Hash
    
    has_many :attendees
    has_many :users, :through => :attendees

    def self.sort_options
        return ['name','date']
    end
    
    def self.ethnicity_options
        return [:African, :American, :Asian, :French, :Indian, :Italian, :Latin_american, :Mediterranean, :Middle_eastern, :Spanish, :NA]
    end
    
    def self.dietary_restrictions_options
       return [:Gluten_free, :Nut_free , :Vegetarian, :Vegan,  :Paleo, :Keto, :Kosher, :NA] 
    end
    
    def self.category_options
        return [:Potluck, :Restaurant, :Breakfast, :Brunch, :Lunch, :Dinner, :All_day, :Other]
    end
    
    def self.search_by_name search_term
        return Event.where("name like ?", "%#{search_term}%").to_a
    end

end