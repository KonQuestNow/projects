require 'selenium-webdriver'

#driver = Selenium::WebDriver.for :chrome

  driver = Selenium::WebDriver.for(
    :remote,
    url: 'http://localhost:4444/wd/hub',
    desired_capabilities: :firefox)

# Given(/^We navigate to the homepage$/) do
  driver.navigate.to "https://soundcloud.com/equinox541/spring-fling-mix#t=0:01"
# end

# When(/^We search for the word Football$/) do
#   driver.find_element(:id, 'cb-s-trigger').click
#   driver.find_element(:id, 'cb-menu-search').send_keys("football")
#   driver.find_element(:id, 'cb-menu-search').send_keys:return
# end

# Then(/^The results for the search will be displayed$/) do
#   wait = Selenium::WebDriver::Wait.new(:timeout => 5) # seconds
#   begin
#     element = wait.until { driver.find_element(:id => "main").text.include?("football") }
#    # expect(element.text).to eq('football')
#   ensure
sleep(30)
#   end

  driver.quit


