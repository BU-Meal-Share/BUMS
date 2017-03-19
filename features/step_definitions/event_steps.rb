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