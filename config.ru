# frozen_string_literal: true

# This file is used by Rack-based servers to start the application.

require_relative "config/environment"

# Delete old prebuilt frontend before new build
`cd public && rm -rf build`

# Build frontend before start
`cd client && yarn && yarn build`

run Rails.application
Rails.application.load_server
