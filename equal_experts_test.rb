require 'rubygems'
require 'selenium-webdriver'
require 'pry'

wait = Selenium::WebDriver::Wait.new(:timeout => 10)

driver = Selenium::WebDriver.for :firefox
# driver = Selenium::WebDriver.for :chrome
driver.get 'http://hotel-test.equalexperts.io/'

element = driver.find_element :id => 'firstname'
element.send_keys ('a'..'z').to_a.shuffle[0, 8].join
element = driver.find_element :id => 'lastname'
element.send_keys ('a'..'z').to_a.shuffle[0, 7].join
element = driver.find_element :id => 'totalprice'
element.send_keys rand(50.0..1000.0).round(2)

select = Selenium::WebDriver::Support::Select.new(driver.find_element(:id, 'depositpaid'))
select.select_by(:text, 'false')

#element = driver.find_element(:id, 'ui-datepicker-div').click
element = driver.find_element :css => 'input#checkin'
element.send_keys '2017-10-05'


binding.pry


driver.find_element(:id, 'checkout').click

driver.find_element(:partial_link_text, '25').click


driver.find_element(:css, '#form > div:nth-child(1) > div:nth-child(7) > input:nth-child(1)').click

puts "Page title is #{driver.title}"
driver.quit