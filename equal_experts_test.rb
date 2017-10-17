require 'rubygems'
require 'selenium-webdriver'
require 'pry'

driver = Selenium::WebDriver.for :firefox
# driver = Selenium::WebDriver.for :chrome
driver.get "http://hotel-test.equalexperts.io/"

element = driver.find_element :id => "firstname"
element.send_keys "firstname"
element = driver.find_element :id => "lastname"
element.send_keys "surname"
element = driver.find_element :id => "totalprice"
element.send_keys "199.99"

select = Selenium::WebDriver::Support::Select.new(driver.find_element(:id, "depositpaid"))
select.select_by(:text, "false")

driver.find_element(:id, 'checkin').click
driver.find_element(:id, 'ui-datepicker-div')
driver.find_element(:partial_link_text, '20').click

driver.find_element(:id, 'checkout').click
driver.find_element(:id, 'ui-datepicker-div')
driver.find_element(:partial_link_text, '25').click
binding.pry

select.select_by(:text, 'save').click



puts "Page title is #{driver.title}"

wait = Selenium::WebDriver::Wait.new(:timeout => 10)
wait.until { driver.title.downcase.start_with? "cheese!" }

puts "Page title is #{driver.title}"
driver.quit