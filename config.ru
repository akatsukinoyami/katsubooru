# frozen_string_literal: true

# This file is used by Rack-based servers to start the application.

require_relative "config/environment"

puts "\n--- Delete old build of frontend before new build ---"
`cd public && rm -rf build`

puts "\n--- Build frontend before server start ---"
`cd client && yarn && yarn build`
puts "\n"

run Rails.application
Rails.application.load_server
