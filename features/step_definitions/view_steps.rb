When(/^I visit the homepage$/) do
  visit "/"
end

Then(/^I see "(.*?)"$/) do |text|
  expect(page).to have_content(text)
end
