Given /the following events exist/ do |table|                                                                     
  table.hashes.each do |element|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Event.create!(element)
  end                                       
end            


#Then(/^the director of "([^"]*)" should be "([^"]*)"$/) do |title, director|   
#  expect(Movie.find_by_title(title).director).to eq director 
#  # pending # Write code here that turns the phrase above into concrete actions                                         
#end  

#Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
#  #  ensure that that e1 occurs before e2.
#  #  page.body is the entire content of the page as a string.
#  # fail "Unimplemented"
#  expect(page.body.index(e1)).to be < page.body.index(e2)
#end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

#When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
#  # HINT: use String#split to split up the rating_list, then
#  #   iterate over the ratings and reuse the "When I check..." or
#  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
#  # fail "Unimplemented"
#  rating_list.split(', ').each do |rating|
#    if uncheck 
#      uncheck("ratings[#{rating}]")
#    else
#      check("ratings[#{rating}]")
#    end
#  end
#end

Then /I should not see "([^"]*)" after "([^"]*)"/ do |event_name, event_header|
  index = page.body.index("#{event_header}")
  search_string = page.body[index..page.body.length]
  expect(search_string.include?(event_name)) == false
end

Then /I should see all the events/ do
  # Make sure that all the movies in the app are visible in the table
  expect(page).to have_selector('tbody tr', count: Event.count)
  # fail "Unimplemented"
end


When /^I select date field "(.*?)" with "(.*?)"$/ do |field, date|
  select_date(date, :from => field)
end

#And /^I fill in "(.*?)" date field with "(.*?)"$/ do |field_name, date_components|
#  label = find("label", text: field_name)
#  select_base_id = label[:for]
#  date_components.split(",").each_with_index do |value, index|
#    select value.strip, from: "#{select_base_id}_#{index+1}i"
#  end
#end

#This works, just need to split up the date string into its components
#When /^I fill in date field "(.*?)" with "(.*?)"$/ do |field_name, date_string|
#  select date_components, :from => "#{field_name}_1i"
#  select date_components, :from => "#{field_name}_2i"
#  select date_components, :from => "#{field_name}_3i"
#end