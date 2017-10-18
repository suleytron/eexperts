load 'support/env.rb'

driver = Selenium::WebDriver.for :chrome

driver.get 'http://hotel-test.equalexperts.io/'

element = driver.find_element :id => 'firstname'
first_name = ('a'..'z').to_a.shuffle[0, 8].join
element.send_keys first_name

element = driver.find_element :id => 'lastname'
last_name = ('a'..'z').to_a.shuffle[0, 7].join
element.send_keys last_name
element = driver.find_element :id => 'totalprice'
total_price = rand(50.0..1000.0).round(2)
element.send_keys total_price

select = Selenium::WebDriver::Support::Select.new(driver.find_element(:id, 'depositpaid'))
select.select_by(:text, 'false')

#  todo: ideally interact with fly-out need an identifier.
arriving = Date.today
element = driver.find_element css: 'input#checkin'
element.send_keys arriving


departing = Date.today + 10
element = driver.find_element css: 'input#checkout'
element.send_keys departing


driver.find_element(:css, '#form > div:nth-child(1) > div:nth-child(7) > input:nth-child(1)').click
driver.navigate().refresh()


puts "Page title is #{driver.title}"
driver.quit