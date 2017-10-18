require 'rubygems'
require 'selenium-webdriver'
require 'pry'
require 'date'
require 'capybara'

driver = Selenium::WebDriver.for :firefox

#Capybara.default_driver = driver

# driver.manage.timeouts.implicit_wait = 4

# driver = Selenium::WebDriver.for :chrome