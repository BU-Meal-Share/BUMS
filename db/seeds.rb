# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Event.create!(name: 'Meat festival', date: '22-Nov-2017', description: 'lots of meat', ingredients: 'meat')

events = [{:name => 'Who Wants Some Grub?', :date => '25-Nov-1992'},
    	  {:name => 'The Terminator', :date => '26-Oct-1984'},
    	  {:name => 'When Harry Met Sally', :date => '21-Jul-1989'},
      	  {:name => 'The Help', :date => '10-Aug-2011'},
      	  {:name => 'Chocolat', :date => '5-Jan-2001'},
      	  {:name => 'Amelie', :date => '25-Apr-2001'},
      	  {:name => '2001: A Space Odyssey', :date => '6-Apr-1968'},
      	  {:name => 'The Incredibles', :date => '5-Nov-2004'},
      	  {:name => 'Raiders of the Lost Ark', :date => '12-Jun-1981'},
      	  {:name => 'Chicken Run', :date => '21-Jun-2000'}
      	 ]

events.each do |event|
  Event.create!(event)
end