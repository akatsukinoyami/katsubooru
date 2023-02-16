# frozen_string_literal: true

# This file is used by Rack-based servers to start the application.

require_relative "config/environment"

puts "\n--- Saving API documentation ---"
`rails rswag:specs:swaggerize`

puts "\n--- Building frontend before server start ---"
`cd client && yarn && yarn build`
puts "\n"

run Rails.application
Rails.application.load_server
