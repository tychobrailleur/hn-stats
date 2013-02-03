source 'http://rubygems.org'

gem 'rails', '3.2.11'

group :development, :test do
  gem 'rspec-rails', '2.11.0'
  gem 'mongoid-rspec', '~> 1.6.0'
  gem 'shoulda-matchers'
end

platforms :jruby do
  gem 'activerecord-jdbcsqlite3-adapter'
  gem 'jruby-openssl'
end

platforms :ruby do
  gem 'sqlite3'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyrhino'

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To make UI nice.
gem 'rails-boilerplate'
gem 'bootstrap-sass'

# MongoDB persistence
gem 'mongoid', '~> 3.0.0'

# As RubyGems is read-only these days, get gem from github.
# See http://gembundler.com/git.html
gem 'hn-api', github: 'tychobrailleur/hn-api', branch: 'master'

# Scheduled tasks, see config/initializers/task_scheduler.rb
gem 'rufus-scheduler'

gem 'hashie'

group :test do
  gem 'capybara'
  gem 'cucumber-rails', '1.3.0', :require => false
  gem 'database_cleaner', '0.9.1'
end

# the javascript engine for execjs gem
platforms :jruby do
  group :assets do
    gem 'therubyrhino'
  end
end
