Given /^a user visits the home page$/ do
  visit root_path
end

Then /^he should see the site banner$/ do
  page.should have_selector(".container a.brand", text: "HnStats")
end

Then /^he should see the current statistics$/ do
  page.should have_selector("#average", text: "10")
  page.should have_selector("#median", text: "42")
  page.should have_selector("#mode", text: "34.5")
end
