Given /the following events exist/ do |table|                                                                     
  table.hashes.each do |element|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Event.create!(element)
  end                                       
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