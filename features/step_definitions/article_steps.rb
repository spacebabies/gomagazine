Given(/^a homepage article "(.*?)"$/) do |head|
  FactoryGirl.create :article, :onhomepage, head: head
end
