Given /^a user visits the home page$/ do
  visit root_path
end

Then /^he should see the site banner$/ do
  page.should have_selector(".container a.brand", text: "HnStats")
end
