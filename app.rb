ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __FILE__)
require 'bundler/setup'

require 'sinatra'
require 'pry'


require 'active_record'
require 'erb'
require 'yaml'
dbconfig = YAML.load(ERB.new(File.read("config/database.yml")).result)[ENV['RACK_ENV']]
ActiveRecord::Base.establish_connection(dbconfig)

Dir['./models/*.rb'].each { |f| require f } 

Dir['./controllers/*.rb'].each { |f| require f } 
