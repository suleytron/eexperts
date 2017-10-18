require 'rubygems'
require 'selenium-webdriver'
require 'pry'
require 'date'
require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'cucumber'

Capybara.default_driver = :selenium

World(Capybara::DSL)
