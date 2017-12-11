source 'https://rubygems.org'

gem 'rails', '4.2.10'
gem 'sqlite3'
gem 'jquery-rails'
gem 'responders'

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

# [ job queue and processing libraries ]
gem 'delayed_job'
gem 'delayed_job_active_record'
gem 'stalker'
gem 'private_pub'

# [ debug and dev tools ]
group :development do
  gem 'pry'
  gem 'pry-nav'
  gem 'spork'
  gem 'rb-inotify' if RUBY_PLATFORM.downcase.include?("linux")
  gem 'rb-fsevent'
  gem 'guard'
  gem 'guard-spork'
  gem 'spork-testunit'
end
