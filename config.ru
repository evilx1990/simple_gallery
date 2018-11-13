# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application

require 'resque/server'
run Rack::URLMap.new "/" => Pik::Application,  "/resque" => Resque::Server.new