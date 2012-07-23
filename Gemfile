source 'https://rubygems.org'

# [ stock rails 3.2 gems ]
gem 'rails', '3.2.2'
gem 'sqlite3'
gem 'jquery-rails'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end


# [ job queue and processing libraries ]
gem 'delayed_job'
gem 'delayed_job_active_record'
gem 'stalker'
gem 'faye'

# [ debug and dev tools ]
group :development do
  gem 'pry'
  gem 'pry-nav'
  gem 'spork'
  gem 'rb-inotify' if RUBY_PLATFORM.downcase.include?("linux")
  gem 'rb-fsevent', "~> 0.9.0" if RUBY_PLATFORM.downcase.include?("darwin")
  gem 'guard'
  gem 'guard-spork'
  gem 'spork-testunit'
  gem 'thin'
end