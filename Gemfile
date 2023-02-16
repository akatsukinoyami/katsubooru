# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.3"

gem "bcrypt", "~> 3.1.7"              # Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem "bootsnap", require: false        # Reduces boot times through caching; required in config/boot.rb
gem "carrierwave", "~> 2.2"           # File storing for rails app
gem "jbuilder"                        # Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jwt", "~> 2.7"                   # Use Json Web Token (JWT) for token based authentication
gem "pagy", "~> 6.0"                  # The Best Pagination Ruby Gem
gem "pg", "~> 1.1"                    # Use postgresql as the database for Active Record
gem "pp", "~> 0.4.0"                  # PrettyPrint
gem "puma", "~> 5.0"                  # Use the Puma web server [https://github.com/puma/puma]
gem "rack-cors"                       # Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem "rails", "~> 7.0.4", ">= 7.0.4.2" # Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rswag", "~> 2.8"                 # Swagger API and UI for Rails
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby] # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem "kredis"                        # Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw] # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "pry", "~> 0.14.2"
  gem "rspec-rails", "~> 6.0"
end

group :development do
  gem "rails-erd", "~> 1.7"           # Will generate a diagram based on your application's Active Record models
  gem "rubocop", "~> 1.44"
  # gem "spring"                      # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
end
