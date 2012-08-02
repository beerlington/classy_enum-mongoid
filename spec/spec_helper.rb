$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'rubygems'
require 'mongoid'
require 'action_view'
require 'action_controller'
require 'rspec/rails'
require 'classy_enum-mongoid'

Mongoid.configure do |config|
  config.connect_to("mongoid-rspec-test")
end

RSpec.configure do |config|
  config.color_enabled = true
end
