source 'https://rubygems.org'

gem 'rails', '4.2.4'

gem 'rails-api'

gem 'stats_collector', git: 'https://github.com/mustela/stats-collector.git', branch: :develop

group :development do
  gem 'spring'
  gem 'rubocop', require: false
  gem 'pry-rails'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'factory_girl_rails'
  gem 'faker'
end

group :test do
  gem 'simplecov'
  gem 'simplecov-csv'
end
